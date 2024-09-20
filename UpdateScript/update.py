import json
from dataclasses import dataclass

@dataclass
class PathList:
    name : str
    items : list[str]
    paths : list['PathList']

def add_to_tree(root: PathList, path: list[str], item: str):
    current_node = root
    for folder in path:
        found = False
        if root.name == folder:
            found = True; 

        for child in current_node.paths:
            if child.name == folder:
                current_node = child
                found = True
                break
        
        if not found:
            new_node = PathList(name=folder, items=[], paths=[])
            current_node.paths.append(new_node)
            current_node = new_node
    
    current_node.items.append(item)

def getPathAndName(assetPath : str, doubleSlash: bool):
    start = assetPath.find("/BPs/") + 4
    end = assetPath.rfind("/", start)
    if doubleSlash:
        end = assetPath.rfind("/", start, end)
    part1 = assetPath[start+1:end].split('/')
    part2 = assetPath.split('.')[0]
    part2 = part2[part2.find("BP_") + 3:]
    if(part2[0].isnumeric()):
        part2 = "_" + part2
    part2 = part2.replace('-', '_')
    return part1, part2

def addJsonContents(pathlists: PathList, actor: str, path: str, json : json, double : bool):
    for dictionary in json[0]["Rows"]:
        paths, name = getPathAndName(json[0]["Rows"][dictionary][actor][path], double)
        fullname = name + " = \"" + json[0]["Rows"][dictionary][actor][path] + "\""
        add_to_tree(pathlists, paths, fullname)

def generate_lua_string(node: PathList, indent: int = 0) -> str:
    indent_str = '      ' * indent
    lua_str = f"{indent_str}{node.name} = {{\n"

    if node.items:
        for item in node.items:
            lua_str += f"{indent_str}      {item},\n"

    if len(node.paths) > 0:
        lua_str += "\n"

    for path in node.paths:
        lua_str += generate_lua_string(path, indent + 1)
    if indent != 0:
        lua_str += f"{indent_str}}},\n"
    else:
        lua_str += f"{indent_str}}}\n"
    lua_str += "\n"
    return lua_str

pathlists : PathList = PathList(name="Items", items=[], paths=[])

weaponJson = json.loads(open("UpdateScript\DT_WeaponInfos.json", "r").read())
generalItemInfos = json.loads(open("UpdateScript\DT_GeneralItemInfos.json", "r").read())
attachments = json.loads(open("UpdateScript\DT_AttachmentInfos.json", "r").read())
ammo = json.loads(open("UpdateScript\DT_AmmoInfos.json", "r").read())
ammoContainer = json.loads(open("UpdateScript\DT_AmmoContainerInfos.json", "r").read())
artifacts = json.loads(open("UpdateScript\DT_ArtefactNestInfos.json", "r").read())

addJsonContents(pathlists=pathlists, actor="ItemActor", path="AssetPathName", json=weaponJson, double=True)
addJsonContents(pathlists=pathlists, actor="ItemActor", path="AssetPathName", json=generalItemInfos, double=False)
addJsonContents(pathlists=pathlists, actor="ItemActor", path="AssetPathName", json=attachments, double=False)
addJsonContents(pathlists=pathlists, actor="ItemActor", path="AssetPathName", json=ammo, double=False)
addJsonContents(pathlists=pathlists, actor="ItemActor", path="AssetPathName", json=ammoContainer, double=False)
addJsonContents(pathlists=pathlists, actor="NestClass", path="ObjectPath", json=artifacts, double=False)

finalFile = open("ITR2_Items.lua", "w")
finalFile.write("local " + generate_lua_string(pathlists))