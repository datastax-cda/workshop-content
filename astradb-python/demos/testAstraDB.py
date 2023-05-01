from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider

username = "token"
token = "AstraCS:ikUkakuSbHjCCxSEfhTXzpiP:3dfcf7c2343dad5fe891860e6354cc41ad656f75ee1c02e0e91eef76496f6f5a"
secureBundleLocation = "../../astradb-observability/demos/bundle.zip"

keyspace = "system"
table = "local"

cloud_config= {
    'secure_connect_bundle': secureBundleLocation
}
auth_provider = PlainTextAuthProvider(username, token)
cluster = Cluster(cloud=cloud_config, auth_provider=auth_provider)
session = cluster.connect()

row = session.execute("select cluster_name from system.local").one()
if row:
    print("cluster name = " + row[0])
else:
    print("An error occurred.")

pStatement = session.prepare("""
    SELECT column_name FROM system_schema.columns WHERE keyspace_name=? AND table_name=?;
""")

rows = session.execute(pStatement,[keyspace,table])
print("\nColumns for " + keyspace + "." + table)
for row in rows:
    print(row[0])
