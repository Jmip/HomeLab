# Import the MongoClient from the pymongo library.
from pymongo import MongoClient

# Define the connection URI and the database name.
# NOTE: Make sure to update the connection string if your MongoDB is not on localhost or requires authentication.
uri = "mongodb://localhost:27017/"
db_name = 'Ericsson-PoC'  # Replace with your desired database name
collection_name = 'PPM'

# Create the data for the five servers.
servers = [
    # AWS Server 1
    {
        "Server name": "web-server",
        "Server FQDN": "web-server.aws.example.com",
        "Site": "East US",
        "City": "Ashburn",
        "Country": "USA",
        "System Type": "Cloud",
        "Platform": "AWS",
        "Service level": "6",
        "OS Instance Role": "ec2",
        "OS Family": "Ubuntu",
        "OS Type": "Ubuntu 22.04",
        "OS version": "22.04",
        "Life-Cycle": "Deployed",
        "Support Team": "Ericsson Platform Operations",
        "Business Application": "AWS LAB Dev",
        "Business Service": "AWS Laboratory",
        "Portfolio Area": "GFGO",
        "Subportfolio Area": "GFGO Development",
        "Owner": "Mihai",
        "Owner Email": "mihai@poc.com",
        "Supplier": "Self-Hosted"
    },
    # AWS Server 2
    {
        "Server name": "devops-server",
        "Server FQDN": "devops-server.aws.example.com",
        "Site": "West Europe",
        "City": "Frankfurt",
        "Country": "Germany",
        "System Type": "Cloud",
        "Platform": "AWS",
        "Service level": "6",
        "OS Instance Role": "ec2",
        "OS Family": "Ubuntu",
        "OS Type": "Ubuntu 22.04",
        "OS version": "22.04",
        "Life-Cycle": "Deployed",
        "Support Team": "Ericsson Platform Operations",
        "Business Application": "AWS LAB Dev",
        "Business Service": "AWS Laboratory",
        "Portfolio Area": "GFGO",
        "Subportfolio Area": "GFGO Development",
        "Owner": "Mihai",
        "Owner Email": "mihai@poc.com",
        "Supplier": "Self-Hosted"
    },
    # AWS Server 3
    {
        "Server name": "db-server",
        "Server FQDN": "db-server.aws.example.com",
        "Site": "East Asia",
        "City": "Tokyo",
        "Country": "Japan",
        "System Type": "Cloud",
        "Platform": "AWS",
        "Service level": "6",
        "OS Instance Role": "ec2",
        "OS Family": "Ubuntu",
        "OS Type": "Ubuntu 22.04",
        "OS version": "22.04",
        "Life-Cycle": "Deployed",
        "Support Team": "Ericsson Platform Operations",
        "Business Application": "AWS LAB Dev",
        "Business Service": "AWS Laboratory",
        "Portfolio Area": "GFGO",
        "Subportfolio Area": "GFGO Development",
        "Owner": "Mihai",
        "Owner Email": "mihai@poc.com",
        "Supplier": "Self-Hosted"
    },
    # Azure Server 1
    {
        "Server name": "api-server-04",
        "Server FQDN": "api-server-04.azure.example.com",
        "Site": "Central US",
        "City": "Iowa",
        "Country": "USA",
        "System Type": "Cloud",
        "Platform": "Azure",
        "Service level": "6",
        "OS Instance Role": "avm",
        "OS Family": "Ubuntu",
        "OS Type": "Ubuntu 22.04",
        "OS version": "22.04",
        "Life-Cycle": "Deployed",
        "Support Team": "Ericsson Platform Operations",
        "Business Application": "Azure LAB Dev",
        "Business Service": "Azure Laboratory",
        "Portfolio Area": "GFGO",
        "Subportfolio Area": "GFGO Development",
        "Owner": "Mihai",
        "Owner Email": "mihai@poc.com",
        "Supplier": "Self-Hosted"
    },
    # Azure Server 2
    {
        "Server name": "cache-server-05",
        "Server FQDN": "cache-server-05.azure.example.com",
        "Site": "Brazil South",
        "City": "Sao Paulo",
        "Country": "Brazil",
        "System Type": "Cloud",
        "Platform": "Azure",
        "Service level": "6",
        "OS Instance Role": "avm",
        "OS Family": "Windows",
        "OS Type": "Windows 2022",
        "OS version": "2022",
        "Life-Cycle": "Deployed",
        "Support Team": "Ericsson Platform Operations",
        "Business Application": "Azure LAB Dev",
        "Business Service": "Azure Laboratory",
        "Portfolio Area": "GFGO",
        "Subportfolio Area": "GFGO Development",
        "Owner": "Mihai",
        "Owner Email": "mihai@poc.com",
        "Supplier": "Self-Hosted"
    }
]

# Main function to connect and insert data.
def run():
    # Create a new MongoClient
    client = MongoClient(uri)

    try:
        # Get the database and collection
        db = client[db_name]
        collection = db[collection_name]

        # Check if the collection is empty. This is a simple way to prevent re-inserting data.
        if collection.count_documents({}) > 0:
            print(f"Collection '{collection_name}' already contains data. Skipping insertion.")
            return

        # Insert the documents into the collection
        result = collection.insert_many(servers)
        print(f"{len(result.inserted_ids)} documents were inserted into the '{collection_name}' collection.")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # Close the connection
        client.close()
        print("Connection to MongoDB closed.")

# Execute the main function
if __name__ == "__main__":
    run()