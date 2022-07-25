# Import required modules
import boto3
import argparse
import json

def get_running_instance_ids(ec2_client):
    """
    Collects the instance id or id's based on the filter's provided.
    We can always change the filters based on our requirements.
    """
    reservations = ec2_client.describe_instances(Filters=[
        {
            "Name": "instance-state-name",
            "Values": ["running"],
        }
    ]).get("Reservations")

    """
    Instances are associated with a reservation: >>> instances = reservations[0].instances >>> instances [Instance:i-00000000]
    
    """

    instance_ids = []
    for reservation in reservations:
        for instance in reservation["Instances"]:
            instance_ids.append(instance["InstanceId"])
    return instance_ids

def print_instance_as_json(ec2_client, instance_ids, key):
    """
    Prints the instance metadata in JSON format.
    """
    reservations = ec2_client.describe_instances(InstanceIds=instance_ids).get("Reservations")
    for reservation in reservations:
        for instance in reservation['Instances']:
            if key is None:
                print(json.dumps(reservation, indent=4, sort_keys=True, default = str))
            else:
                print(instance.get(key))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Output AWS Instance Metadata either as file or output value of a particular key provided')
    parser.add_argument('--key', type=str, help="Provide key you want the value for")
    parser.add_argument('--instance', type=str, help="instance id")
    parser.add_argument('--region', type=str, help="region", default="us-east-1")

    args = parser.parse_args()

    ec2_client = boto3.client("ec2", region_name=args.region)

    if args.instance:
        instance_ids = [args.instance]
    else:
        instance_ids = get_running_instance_ids(ec2_client)

    print_instance_as_json(ec2_client, instance_ids, args.key)
