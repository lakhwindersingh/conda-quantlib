cube(`inventory`, {
  sql_table: `nb_tarantula.inventory`,
  
  data_source: `default`,
  
  joins: {
    
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primary_key: true
    },
    
    nb_last_updated_by: {
      sql: `nb_last_updated_by`,
      type: `string`
    },
    
    nb_last_updated: {
      sql: `nb_last_updated`,
      type: `time`
    }
  },
  
  measures: {
    count: {
      type: `count`
    },
    
    total: {
      sql: `total`,
      type: `sum`
    },
    
    current_total: {
      sql: `current_total`,
      type: `sum`
    }
  },
  
  pre_aggregations: {
    // Pre-aggregation definitions go here.
    // Learn more in the documentation: https://cube.dev/docs/caching/pre-aggregations/getting-started
  }
});
