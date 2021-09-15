import typing
import json
import argparse


def parse_path(path: str) -> typing.List[str]:
    return [s.strip() for s in path.split('/')]
	


def extract(j_obj: typing.Any, path_parts: typing.List[str]) -> typing.Any:
    if len(path_parts) == 0:
        return j_obj
    part = path_parts.pop(0)
    if part in j_obj:
        return extract(j_obj[part], path_parts)
    else:
        raise Exception(f"path not found at key {part}")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Extract json by path')
    parser.add_argument('-j_str', type=str, help='json string', required=True)
    parser.add_argument('-path', type=str, help='path to extract separated by /', required=True)
    args = parser.parse_args()
    result = extract(json.loads(args.j_str), parse_path(args.path))
    print(json.dumps(result, sort_keys=True, indent=4))
