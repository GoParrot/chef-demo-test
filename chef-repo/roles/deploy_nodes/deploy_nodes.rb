name 'deploy_nodes'
description 'Nodes for apache to be deployed'
run_list 'recipe[apache-test::default]'
