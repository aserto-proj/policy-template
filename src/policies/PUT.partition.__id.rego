package vertex.PUT.partition.__id

import data.vertex.check_partition
import data.vertex.check_playgroup
import data.vertex.check_organization

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

permission := "can_edit"

allowed {
  check_partition(input.user.id, permission, input.resource.id)
}

allowed {
  check_playgroup(input.user.id, permission, input.resource.id)
}

allowed {
  check_organization(input.user.id, permission, input.resource.id)
}
