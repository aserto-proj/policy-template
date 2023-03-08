package vertex.POST.partition

import data.vertex.check_partition
import data.vertex.check_playgroup
import data.vertex.check_organization

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

permission := "can_create"

allowed {
  check_partition(input.user.id, permission, input.resource.id)
}

allowed {
  check_playgroup(input.user.id, permission, input.resource.id)
}

allowed {
  check_organization(input.user.id, permission, input.resource.id)
}
