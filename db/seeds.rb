HOBBIES = [
  "Running",           #1
  "Swimming",          #2
  "Napping",           #3
  "Cuddling",          #4
  "Eating",            #5
  "Sunbathing",        #6
  "Flying",            #7
  "Long Walks",        #8
  "Fetch",             #9
  "Kissing",           #10
  "Chasing",           #11
  "People Watching",   #12
  "Stalking",          #13
  "Grooming"           #14
]

HOBBY_IDS = HOBBIES.map.with_index{ |hobby, i| (i + 1).to_s }

HOBBIES.each do |hobby|
  Hobby.create!(name: hobby)
end

def random_type
  User::ANIMAL_TYPES[rand(User::ANIMAL_TYPES.length)]
end

def random_state
  User::STATES[rand(50)]
end

def random_month
  rand(12) + 1
end

def random_day
  rand(28) + 1
end

def random_year
  rand(31) + 1984
end

def random_gender
  ["M", "F"][rand(2)]
end

def random_hobbies
  random_ids = []
  hobby_ids = HOBBY_IDS.dup
  hobby_amt = rand(HOBBY_IDS.length + 1)

  hobby_amt.times do
    hobby_ids.shuffle!
    random_ids << hobby_ids.pop
  end

  random_ids
end

def save_pictures(username, image_path)
  User
    .find_by_username(username)
    .pictures
    .create(image_url: "https://res.cloudinary.com/dfvpir1ro/image/upload/h_440/#{image_path}",
            thumb_url: "https://res.cloudinary.com/dfvpir1ro/image/upload/h_160/#{image_path}")
end

User.create(
  username: "drogon",
  password: "password",
  gender: "M",
  birthdate: Time.new(2011, 6, 19),
  city: "Westeros",
  state: "Florida",
  animal_type: "dragon",
  website: "http://gameofthrones.wikia.com/wiki/Drogon",
  instagram: "https://instagram.com/gameofthrones/",
  about_me: "My mom's a hottie, right? Right? She can be annoying though. She wasn't going to sign me up for this site, so I did it myself. I'm the oldest, so I'll do whatever I want. Jk, I love my mom.",
  hobby_ids: ["5", "6", "7", "8"]
)
save_pictures("drogon", "v1434620348/dvzwqz0emdf5tkcteqar.jpg")
save_pictures("drogon", "v1434620352/goc0t6fibligpny5vgjl.png")
save_pictures("drogon", "v1434620350/v3dljccz9lxcnaxrgpa6.png")
save_pictures("drogon", "v1434620348/hmlwkdonpi4egzvmc3hm.jpg")
save_pictures("drogon", 'v1434620348/sl4n1sfgoeomspq70zgv.jpg')

User.create(
  username: "charley",
  password: "password",
  gender: "M",
  birthdate: Time.new(2013, 3, 18),
  city: "San Francisco",
  state: "California",
  animal_type: "dog",
  breed: "Retriever, Labrador Mix",
  website: "https://www.sfspca.org/adoptions/pet-details/20818764",
  about_me: "Charley needs a family! He's a big boy with a goofy smile and would love a human to play with to his heart's content.",
  hobby_ids: ["1", "4", "9", "11"]
)
save_pictures("charley", "v1434621458/jsbmrnimgnzwjxptx8kh.jpg")
save_pictures("charley", "v1434621457/xi9atb5drn4906jg5sxi.jpg")
save_pictures("charley", "v1434621458/jeptv5duokogt9q7hugt.jpg")

User.create(
  username: "hugo",
  password: "password",
  gender: "M",
  birthdate: Time.new(2013, 8, 1),
  city: "San Jose",
  state: "California",
  animal_type: "dog",
  breed: "Pug",
  instagram: "https://instagram.com/_hugothepug",
  about_me: "His favorite things are his toy duckie and cuddling with mommy and daddy! Often looks confused, but always fun to dress up!",
  hobby_ids: ["3", "4", "9", "10", "12"]
)
save_pictures("hugo", "v1434622459/r0jfspssujtgaahaiivk.jpg")
save_pictures("hugo", "v1434622459/i8dacubp2o0owl9speir.jpg")
save_pictures("hugo", "v1434622459/qjpwk0w3daw4ifuiging.jpg")
save_pictures("hugo", "v1434622459/b13qposywpgyikqgfgia.jpg")
save_pictures("hugo", "v1434622460/sq2vxts84cbnkaaym2zr.jpg")

User.create(
  username: "teddy",
  password: "password",
  gender: "M",
  birthdate: Time.new(2012, 8, 13),
  city: "Boston",
  state: "Massachusetts",
  animal_type: "cat",
  breed: "Jerk",
  website: "https://www.youtube.com/watch?v=b_mVb-G1v1I",
  about_me: "They say black cats are bad luck. Teddy is just bad.",
  hobby_ids: ["3", "6", "13"]
)
save_pictures("teddy", "v1434622919/vme5k51w6s49gfppcla4.jpg")
save_pictures("teddy", "v1434622919/ukh2fs6q8yrme20x11he.jpg")
save_pictures("teddy", "v1434622919/rt4x0ykqxk0drapyogbv.jpg")

User.create(
  username: "pumbaa",
  password: "password",
  gender: "M",
  birthdate: Time.new(2012, 9, 4),
  city: "San Francisco",
  state: "California",
  animal_type: "dog",
  breed: "Bulldog",
  about_me: "He's brought such joy to our lives...when he's not sleeping. Or farting in his sleep.",
  hobby_ids: ["3", "5", "9", "12"]
)
save_pictures("pumbaa", "v1434624281/hfqrao2gl6h8xybnqefk.jpg")
save_pictures("pumbaa", "v1434623871/uwwef5onghreigrp3x3b.jpg")
save_pictures("pumbaa", "v1434624281/obgzoqvcye6dazo67i5i.jpg")
save_pictures("pumbaa", "v1434624281/mpdnnx0lumeavcrqpmmp.jpg")
save_pictures("pumbaa", "v1434623871/vqjpnoo1mcx6xulcx9l9.jpg")
save_pictures("pumbaa", "v1434623871/gphyeg7tygifzsleivaz.jpg")
save_pictures("pumbaa", "v1434623872/onhhjbxb1bpw66jzllob.jpg")
save_pictures("pumbaa", "v1434624281/tibt1lmkypfeixy0qxdk.jpg")
save_pictures("pumbaa", "v1434623871/vgp6sxvbebrx0czdeokj.jpg")
save_pictures("pumbaa", "v1434623871/n6yjnw1a7ope4umvanjy.jpg")

User.create(
  username: "piopi",
  password: "password",
  gender: "F",
  birthdate: Time.new(2009, 10, 12),
  city: "San Jose",
  state: "California",
  animal_type: "dog",
  breed: "Yorkie",
  about_me: "Piopi's adorable. So is my son. I'm not sure who I'm actually showcasing here. Oh well, double the cuteness! Proceed to melt!",
  hobby_ids: ["4", "10", "14"]
)
save_pictures("piopi", "v1434705097/tafmb2glbfe6crug8y0a.jpg")
save_pictures("piopi", "v1434705097/psta5pkykwouso54soz2.jpg")
save_pictures("piopi", "v1434705424/clhmg510szen3ib9xwli.jpg")
save_pictures("piopi", "v1434705098/fspjinq5biiagf3f8g7l.jpg")
save_pictures("piopi", "v1434705097/xje2jlozkzovhbjm6ot1.jpg")
save_pictures("piopi", "v1434705097/gw6c2gymp9rqqijosdqc.jpg")

User.create(
  username: "baiyun",
  password: "password",
  gender: "F",
  birthdate: Time.new(1991, 9, 7),
  city: "San Diego",
  state: "California",
  animal_type: "panda",
  breed: "giant panda",
  website: "https://en.wikipedia.org/wiki/Bai_Yun",
  about_me: "Bai Yun, meaning White Cloud in Chinese, has birthed 6 cubs. Considered the most surviving pandas at a breeding facility outside of China.",
  hobby_ids: ["3", "4", "5"]
)
save_pictures("baiyun", "v1434706393/iju3tntqnfqpfrgz0lzh.jpg")
save_pictures("baiyun", "v1434706393/t70lzxcntk4i5vvcb3qa.jpg")
save_pictures("baiyun", "v1434706393/iqlwipnrbgt6kmlmrmye.jpg")
save_pictures("baiyun", "v1434706393/e8g3e3bnnaik5kburera.jpg")
save_pictures("baiyun", "v1434706393/yimzbfdp7uypusbhlvxb.jpg")

User.create(
  username: "charliesheen",
  password: "password",
  gender: "M",
  birthdate: Time.new(1965, 9, 3),
  city: "Beverly Hills",
  state: "California",
  animal_type: "other",
  breed: "winner",
  website: "http://www.charliesheen.com/",
  instagram: "https://instagram.com/charliesheen/",
  about_me: "What am I doing here? I've decided to expand my winning to the animal kingdom as well. Duh!"
)
save_pictures("charliesheen", "v1434708390/zqxjb57hnmm3j6jcbyoe.jpg")
save_pictures("charliesheen", "v1434708390/kldsohriu7p2dskijbor.jpg")
save_pictures("charliesheen", "v1434708390/opxcvz6otztbmg7pmcpv.jpg")

User.create(
  username: "pocky",
  password: "password",
  gender: "M",
  birthdate: Time.new(2014, 3, 1),
  city: "Oakland",
  state: "California",
  animal_type: "dog",
  breed: "Miniature Poodle",
  instagram: "https://instagram.com/pocky_nguyen",
  about_me: "He loves to run marathons, but most of all, he's such an obedient boy! Check out his instagram for more pics of stuff on his head.",
  hobby_ids: ["1", "4", "6", "8", "9", "11", "14"]
)

save_pictures("pocky", "v1434874672/moap8cqkxitly7ynr4b2.png")
save_pictures("pocky", "v1434874676/xbmxhn8rvxyoy0fz26p0.png")
save_pictures("pocky", "v1434874715/kpxwhxfm84lb8p9wzhle.png")
save_pictures("pocky", "v1434874680/on2xfkkr9xao2njk0boo.png")
save_pictures("pocky", "v1434874679/dbvvchrsueknzy0btsm9.png")
save_pictures("pocky", "v1434874676/lbx4jwkag1j16shuqwfn.png")
save_pictures("pocky", "v1434874676/mebiicq5j1oywdifzvgw.png")
save_pictures("pocky", "v1434874674/hpvqranaqa0ufzmotkhk.png")

User.create(
  username: "akuma",
  password: "password",
  gender: "M",
  birthdate: Time.new(2010, 6, 5),
  city: "San Jose",
  state: "California",
  animal_type: "dog",
  breed: "Shiba Inu",
  instagram: "https://instagram.com/akumatime",
  about_me: "Such a handsome boy. Also, you'd think he's a cat by how solemn he is all the time. Plus side is, he's not too needy!",
  hobby_ids: ["1", "3", "6", "8", "9", "11", "12"]
)

save_pictures("akuma", "v1434875667/uawom9qoblbltv9eqfep.png")
save_pictures("akuma", "v1434875661/y7xjnju2yows62ke2yso.png")
save_pictures("akuma", "v1434875666/c7e05n1bhs9myegqg9kn.png")
save_pictures("akuma", "v1434875666/n69y22sjttlu1zldg39p.png")
save_pictures("akuma", "v1434875661/v4r3jp5rvgy1hr6urjzb.png")

User.create(
  username: "shadowfax",
  password: "password",
  gender: "M",
  birthdate: Time.new(1989, 4, 10),
  city: "Louisville",
  state: "Kentucky",
  animal_type: "other",
  breed: "horse, of the race of the Mearas",
  website: "http://lotr.wikia.com/wiki/Shadowfax",
  about_me: "He is the lord of all horses and has been my friend through many dangers.",
  hobby_ids: ["1", "11"]
)

save_pictures("shadowfax", "v1434877578/mkh0k0qdsioe18olmj3f.jpg")
save_pictures("shadowfax", "v1434877581/zsh56t6yakazarsx3ylr.jpg")
save_pictures("shadowfax", "v1434877578/hxk2wfrqvet6dunjm9w5.jpg")
save_pictures("shadowfax", "v1434877586/wyzweqltrs3zk5qt2knr.gif")

User.create(
  username: "bobby",
  password: "password",
  gender: "M",
  birthdate: Time.new(2007, 3, 21),
  city: "Campbell",
  state: "California",
  animal_type: "dog",
  breed: "beagle",
  instagram: "https://instagram.com/bobbythebeagle/",
  about_me: "Saw this boy when he was about a week old, and it was love at first sight. He's the handsomest beagle ever! Look at his colors! He used to be a ball of energy when he was a puppy, but now he enjoys napping anywhere warm and soft and watching me do chores.",
  hobby_ids: ["3", "4", "5", "6", "9", "12"]
)

save_pictures("bobby", "v1434909495/rsijhhnpswzmst3anpji.png")
save_pictures("bobby", "v1434909475/oyl2l2ddskcnjbhp9azl.jpg")
save_pictures("bobby", "v1434909494/zf6uczpoh5mxd3w3lagh.png")
save_pictures("bobby", "v1434909492/w8gq4z89zw2y4qe9grpp.png")
save_pictures("bobby", "v1434909494/cmdasylhveucw6tjpkja.png")
save_pictures("bobby", "v1434909491/l5w5jmfurx0z21racnnp.png")
save_pictures("bobby", "v1434909486/wlndhzo1sqx9zvhu4ceu.png")




#frenchie: cutest little nuggest!
#scruffy: they call me scruffy mcscrufferson




User.create(
  username: "conan",
  password: "password",
  gender: "M",
  birthdate: Time.new(1986, 1, 2),
  city: "San Francisco",
  state: "California",
  animal_type: "other",
  breed: "human",
  website: "https://conantzou.tumblr.com",
  instagram: "https://instagram.com/conanza",
  about_me: "I'm the owner!",
  hobby_ids: ["1", "2", "3", "4"]
)

save_pictures("conan", "v1434560509/tpaorjsumovlefzywncj.jpg")
save_pictures("conan", "v1434587074/e0v8ffuuw7aau11iqltd.jpg")
User.find_by_username("conan").pictures.create(image_url: "http://img1.wikia.nocookie.net/__cb20080918055501/marveldatabase/images/c/c4/Conan_02.jpg",
                                               thumb_url: "http://img1.wikia.nocookie.net/__cb20080918055501/marveldatabase/images/c/c4/Conan_02.jpg")
User.find_by_username("conan").pictures.create(image_url: "https://static.crowdvoice.com/uploads/237M8sU_1389417789100_r11v9Wi7J2KnyWFe4RR68Q",
                                              thumb_url: "https://static.crowdvoice.com/uploads/237M8sU_1389417789100_r11v9Wi7J2KnyWFe4RR68Q")

50.times do |i|
  name = Faker::Internet.user_name
  url = Faker::Internet.url("www.facebook.com", "/#{name}")

  User.create(
    username: name,
    password: "password",
    gender: random_gender,
    birthdate: Time.new(random_year, random_month, random_day),
    city: Faker::Address.city,
    state: random_state,
    animal_type: random_type,
    breed: "breed",
    website: url,
    instagram: "https://instagram.com/#{name}",
    about_me: "I'm #{name}",
    hobby_ids: random_hobbies
  )
end

(1..50).each do |votee_id|
  (1..50).each do |voter_id|
    next if votee_id == voter_id
    next if rand(3) == 1

    User
      .find(votee_id)
      .received_votes
      .create(voter_id: voter_id, value: rand(2))
  end
end
