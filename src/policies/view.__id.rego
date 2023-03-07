package partition.view.__id

import partition.check

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

allowed {
  check(input.user.id, permission, "organization", input.resource.id)
}

allowed {
  ds.check_permission({
    subject: { "id": input.user.id },
    permission: { "can_read" },
    object: { "type": "playgroup", "key": input.resource.id }
  })
}

allowed {
  ds.check_permission({
    subject: { "id": input.user.id },
    permission: { "can_read" },
    object: { "type": "partition", "key": input.resource.id }
  })
}
