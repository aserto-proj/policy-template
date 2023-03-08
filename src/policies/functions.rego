package partition

check_partition(user_id, permission, partition) := result {
  result := check(user_id, permission, "partition", partition)
}

check_playgroup(user_id, permission, partition) := result {
  pg := get_parent("partition", partition, "partition-playgroup", "playgroup")
  result := check(input.user.id, permission, "playgroup", pg.key)
}

check_organization(user_id, permission, partition) := result {
  pg := get_parent("partition", partition, "partition-playgroup", "playgroup")
  org := get_parent("playgroup", pg.key, "playgroup-org", "organization")
  result := check(input.user.id, permission, "organization", org.key)
}

check(user_id, permission, obj_type, obj_key) := result {
  result := ds.check_permission({
    "subject": { "id": user_id },
    "permission": { "name": permission },
    "object": { "type": obj_type, "key": obj_key }
  })
}

get_parent(object_type, key, relation, subject_type) := parent {
  relations := ds.relation({
    "object": {
      "key": key,
      "type": object_type
    },
    "relation": {
      "name": relation,
      "object_type": object_type
    },
    "subject": {
      "type": subject_type
    },
    "with_objects": true
  })
  parent_id := relations.results[0].subject.id
  parent := relations.objects[parent_id]
}
