class FirebaseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_firebase
    template "firebase.rb", "app/services/firebase/#{file_name.underscore}.rb"
  end

  def generate_rspec
    template "firebase_spec.rb", "spec/services/firebase/#{file_name.underscore}_spec.rb"
  end
end
