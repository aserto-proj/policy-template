package partition

check(user_id, permission, obj_type, obj_key) {
  ds.check_permission({
    "subject": { "id": user_id },
    "permission": { "name": permission },
    "object": { "type": obj_type, "key": obj_key }
  })
}

get_playgroup(partition) {
  get_parent("partition", partition, "partition-playgroup", "playgroup")
}

get_parent(object_type, key, relation, subject_type) := parent {
  relations = ds.relation({
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
  parent_id = relations.results[0].subject.id
  parent = relations.objects[parent_id]
}
