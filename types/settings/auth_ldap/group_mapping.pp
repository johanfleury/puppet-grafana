type Grafana::Settings::Auth_ldap::Group_mapping = Struct[{
  group_dn      => String,
  org_role      => Enum['Editor', 'Viewer', 'Admin'],
  grafana_admin => Optional[Boolean],
  org_id        => Optional[Integer],
}]
