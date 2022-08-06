resource "aws_glue_crawler" "glue_crawler_{{inputs.crawler_name}}" {  
    database_name = "{{inputs.database_name}}"
    name = "{{inputs.crawler_name}}"
    role = "{{inputs.rolearn }}"
    s3_target { 
        path = "s3://{{inputs.s3_target}}"
    } 
    schema_change_policy {
        delete_behavior = "LOG"
        update_behavior = "UPDATE_IN_DATABASE"
         }
}