package partition.edit.__id

import data.partition.check

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

allowed {
  check(input.user.id, "can_edit", "organization", input.resource.id)
}

allowed {
  check(input.user.id, "can_edit", "playgroup", input.resource.id)
}

allowed {
  check(input.user.id, "can_edit", "partition", input.resource.id)
}
