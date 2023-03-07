package partition.view.__id

import data.partition.check

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

allowed {
  check(input.user.id, "can_read", "organization", input.resource.id)
}

allowed {
  check(input.user.id, "can_read", "playgroup", input.resource.id)
}

allowed {
  check(input.user.id, "can_read", "partition", input.resource.id)
}
