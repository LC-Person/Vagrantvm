import os
from fabrictestbed_extensions.fablib.fablib import FablibManager as fablib_manager
# Update this line to specify your project id
project_id = os.environ.get('FABRIC_PROJECT_ID')

# Uncomment the line below if using 'FABRIC Tutorials' Project
#project_id="a7818636-1fa1-4e77-bb03-d171598b0862"

fablib = fablib_manager(project_id=project_id)
fablib.show_config()
fablib.validate_config()
fablib.save_config()