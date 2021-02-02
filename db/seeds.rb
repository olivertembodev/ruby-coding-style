%w[admin user].each do |name|
  Role.where(name: name).first_or_create!
end

if Rails.env.development?
  require 'faker'

  1.upto(10).each do |i|
    attrs = {
      id: i,
      name: Faker::Name.name,
      email: Faker::Internet.email(separators: i.to_s),
      password: 'password',
      password_confirmation: 'password'
    }

    user = User.where(id: i).first

    if user
      user.update(attrs)
    else
      user = User.create!(attrs)
    end

    next if user.avatar.attached?

    url = Faker::Avatar.image(slug: user.name.gsub(' ', '-'), size: '60x60')
    filename = File.basename(URI.parse(url).path)
    file = URI.open(url)
    user.avatar.attach(io: file, filename: filename)
  end

  1.upto(100).each do |i|
    attrs = {
      title: [Faker::Quote.famous_last_words, i].join('-'),
      description: Faker::Lorem.paragraph(sentence_count: 100),
      user_id: User.first.id,
      time_to_read: (1..60).to_a.sample
    }

    blog = Blog.where(id: i).first

    if blog
      blog.update(attrs)
    else
      blog = Blog.create!(attrs)
    end

    next if blog.image.attached?

    url = Faker::LoremFlickr.image(size: '500x200')
    filename = File.basename(URI.parse(url).path)
    file = URI.open(url)
    blog.image.attach(io: file, filename: filename)
  end
end
