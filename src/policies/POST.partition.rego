package vertex.POST.partition

import data.vertex.check_organization
import data.vertex.check_partition
import data.vertex.check_playgroup

# default to a "closed" system, 
# only grant access when explicitly granted

default allowed = false

permission := "can_create"

allowed {
	check_partition(input.user.key, permission, input.resource.id)
}

allowed {
	check_playgroup(input.user.key, permission, input.resource.id)
}

allowed {
	check_organization(input.user.key, permission, input.resource.id)
}
