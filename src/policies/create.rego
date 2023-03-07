package partition.create

import data.partition.check

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

allowed {
  check(input.user.id, "can_create", "organization", input.resource.id)
}

allowed {
  check(input.user.id, "can_create", "playgroup", input.resource.id)
}

allowed {
  check(input.user.id, "can_create", "partition", input.resource.id)
}
