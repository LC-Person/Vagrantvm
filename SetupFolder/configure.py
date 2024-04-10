import os
from fabrictestbed_extensions.fablib.fablib import FablibManager as fablib_manager
# Update this line to specify your project id
project_id = os.environ.get('FABRIC_PROJECT_ID')

fablib = fablib_manager(project_id=project_id)
fablib.show_config()
fablib.validate_config()
fablib.save_config()