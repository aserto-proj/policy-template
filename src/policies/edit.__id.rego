package partition.edit.__id

import data.partition.check_partition
import data.partition.check_playgroup
import data.partition.check_organization

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

permission := "can_read"

allowed {
  check_partition(input.user.id, permission, input.resource.id)
}

allowed {
  check_playgroup(input.user.id, permission, input.resource.id)
}

allowed {
  check_organization(input.user.id, permission, input.resource.id)
}
