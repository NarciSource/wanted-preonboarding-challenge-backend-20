import knex from "knex";
import knexConfig from "./knexfile.js";

const dbClient = knex(knexConfig[process.env.NODE_ENV] || "development");

export const transaction = dbClient.transaction.bind(dbClient);
export default dbClient;
