mixin CoreMapper<Model, Entity> {
  Entity mapToEntity(Model model);

  Model mapToModel(Entity domain);
}
