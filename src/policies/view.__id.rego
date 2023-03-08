package partition.view.__id

import data.partition.check
import data.partition.get_parent

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

allowed {
  check(input.user.id, "can_read", "partition", input.resource.id)
}

allowed {
  pg := get_parent("partition", input.resource.id, "partition-playgroup", "playgroup")
  check(input.user.id, "can_read", "playgroup", pg.key)
}

allowed {
  pg := get_parent("partition", input.resource.id, "partition-playgroup", "playgroup")
  org := get_parent("playgroup", pg.key, "playgroup-organization", "organization")
  check(input.user.id, "can_read", "organization", org.key)
}

