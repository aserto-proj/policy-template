package partition.check

check(user_id, permission, obj_type, obj_key) {
  ds.check_permission({
    subject: { "id": user_id },
    permission: { permission },
    object: { "type": obj_type, "key": obj_key }
  })
}

