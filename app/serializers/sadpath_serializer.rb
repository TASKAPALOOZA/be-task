class SadpathSerializer

  def self.incomplete_fields
    { data: { message: 'All fields must be filled in'} }
  end

  def self.email_in_use
    { data: { message: 'Email already in use'} }
  end

  def self.password_mismatch
    { data: { message: 'Passwords must match'} }
  end

  def self.bad_request
    { data: { message: 'bad request'} }
  end

end 