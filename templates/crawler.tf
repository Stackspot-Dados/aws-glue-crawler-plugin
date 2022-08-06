resource "aws_glue_crawler" "glue_crawler_{{inputs.crawler_name}}" {  
    database_name = "{{inputs.database_name}}"
    name = "{{inputs.crawler_name}}"
    role = "{{inputs.rolearn }}"
    {{inputs.source}}_target {  
        {% if inputs.source == 'mongodb' or inputs.source == 'jdbc' %}
        connection_name = "{{inputs.connection}}"
        {% endif %}
        path = "{{inputs.path}}"
    } 
    schema_change_policy {
        delete_behavior = "{{delete_behavior}}"
        update_behavior = "{{update_behavior}}"
    }
}