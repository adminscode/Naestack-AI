
const { CosmosClient } = require('@azure/cosmos');
const endpoint = process.env.COSMOS_ENDPOINT;
const key = process.env.COSMOS_KEY;
const client = new CosmosClient({ endpoint, key });

module.exports = async function (context, req) {
  const config = req.body;
  const container = client.database('naestack').container('configs');
  await container.items.create(config);
  context.res = { status: 200, body: 'Saved' };
};
