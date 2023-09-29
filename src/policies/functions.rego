package vertex

check_partition(user_key, permission, partition) := result {
	result := check(user_key, permission, "partition", partition)
}

check_playgroup(user_key, permission, partition) := result {
	pg := get_parent("partition", partition, "partition-playgroup", "playgroup")
	result := check(user_key, permission, "playgroup", pg.key)
}

check_organization(user_key, permission, partition) := result {
	pg := get_parent("partition", partition, "partition-playgroup", "playgroup")
	org := get_parent("playgroup", pg.key, "playgroup-org", "organization")
	result := check(user_key, permission, "organization", org.key)
}

check(user_key, permission, obj_type, obj_key) := result {
	result := ds.check_permission({
		"subject": {"type": "user", "key": user_key},
		"permission": {"name": permission},
		"object": {"type": obj_type, "key": obj_key},
	})
}

get_parent(object_type, key, relation, subject_type) := parent {
	relations := ds.relation({
		"object": {
			"key": key,
			"type": object_type,
		},
		"relation": {
			"name": relation,
			"object_type": object_type,
		},
		"subject": {"type": subject_type},
		"with_objects": true,
	})
	parent_key := relations.results[0].subject.key
	# the object array is keyed by "subject_type:key"
	object_key = concat(":", [subject_type, parent_key])
	parent := relations.objects[object_key]
}
