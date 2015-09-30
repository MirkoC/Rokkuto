module AuthObjectCollectionRepresenter
  include Roar::JSON

  collection :auth_objects, extend: AuthObjectRepresenter, class: AuthObject

  def auth_objects
    collect
  end
end
