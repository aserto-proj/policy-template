package partition.delete.__id

import data.partition.check

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

allowed {
  check(input.user.id, "can_delete", "organization", input.resource.id)
}

allowed {
  check(input.user.id, "can_delete", "playgroup", input.resource.id)
}

allowed {
  check(input.user.id, "can_delete", "partition", input.resource.id)
}
