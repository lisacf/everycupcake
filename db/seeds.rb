# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ingredients_list = %w(agave\ nectar
									all-purpose\ flour
									Amarena\ cherries\ in\ syrup
									arrowroot
									baking\ powder
									baking\ soda
									banana
									banana-puree
									black\ bean\ puree
									black\ sesame\ seeds
									blue\ cheese\ crumbles
									blue\ cornmeal
									blue\ jimmies
									blueberries
									blueberry\ puree
									boiling\ water
									brown\ sugar
									butter
									butter\ baking\ spray
									buttermilk
									cake\ flour
									canola\ oil
									caramel
									caramel\ candies
									caramel\ extract
									caramel\ sauce
									cayenne\ pepper
									cherries-pitted
									chestnut\ flour
									chili\ powder
									chipotle\ peppers
									chipotle\ powder
									chocolate\ chips
									chocolate\ hazelnut\ spread-Nutella
									chocolate\ jimmies
									chocolate\ syrup-Hershey's
									chocolate\ syrup-Da\ Vinci
									coarse\ sea\ salt
									cocoa
									cocoa\ powder
									coconut\ extract
									coconut\ milk
									coconut\ palm\ sugar
									condensed\ milk
									confectioners'\ sugar
									corn\ syrup
									cornmeal
									cornstarch
									cream
									cream\ cheese
									cream\ soda
									crystallized\ ginger
									custard\ powder
									dark\ brown\ sugar
									dark\ chocolate
									dark\ rum
									dried\ cherries
									dulce\ de\ leche
									dutch-processed\ cocoa
									egg
									egg\ white
									egg\ yolk
									espresso
									espresso\ powder
									evaporated\ milk
									extra-brute\ cocoa\ powder
									extra-large\ eggs
									Filo\ dough
									Food\ coloring
									fresh\ mint
									gingersnaps
									gluten-free\ flour
									goat\ cheese
									gold\ dust
									golden\ rum
									granulated\ sugar
									ground\ allspice
									ground\ cinnamon
									ground\ nutmeg
									half-and-half
									hazelnut
									hazelnut\ liqueur\ -\ Frangelico
									hazelnut\ meal
									heavy\ cream
									heavy\ whipping\ cream
									hemp\ milk
									honey
									instant\ coffee\ granules
									kosher\ salt
									lavender\ extract
									lemon
									lemon\ juice
									lemon\ peel
									lemon\ zest
									light\ brown\ sugar
									light\ corn\ syrup
									lime
									lime\ juice
									lime\ zest
									liquid\ red\ food\ coloring
									low-fat\ milk
									Madagascar\ vanilla\ extract
									maple\ syrup
									margarine\ -\ nondary
									metallic\ chocolate\ pearls
									milk
									milk\ chocolate
									molasses
									natural\ cherry\ extract
									nonstick\ baking\ spray
									olive\ oil
									orange\ extract
									pecan
									pistachios
									pomegranate\ concentrate
									pomegranate\ juice
									pomegranate\ powder
									popcorn\ kernels
									poppy\ seeds
									powdered\ sugar
									pumpkin\ pie\ spice
									pumpkin\ puree
									pure\ almond\ extract
									pure\ cane\ sugar
									pure\ vanilla\ extract
									raisins
									raw\ pepitas
									rice\ milk
									rum\ flavoring
									salt
									sea\ salt-fine
									semisweet\ chocolate
									semisweet\ chocolate\ chips
									shortbread\ cookies
									sour\ cream
									soy\ milk
									sweetened,\ coconut\ flakes
									sweetened,\ shredded\ coconut
									tahini
									tangerine\ juice
									tapioca
									tapioca\ starch
									torrone-flavored\ paste
									turbinado\ sugar
									unsalted\ butter
									unsweetened\ cocoa\ powder
									vanilla\ bean
									vanilla\ bean\ paste
									vegetable\ oil
									vegetable\ shortening
									walnuts
									water
									whipping\ cream
									white\ chocolate
									white\ coating\ chocolate
									white\ sesame\ seeds
									white\ vinegar
									whole\ milk
									xanthan\ gum
									blackberries
									raspberries
									lychee\ -\ puree
									key\ lime\ juice
									kumquat\ preserves
									orange
									orange\ juice
									orange\ zest
									toasted\ quinoa
									marshmallows
									rice\ cereal-Rice\ Krispies
									black\ tea\ bags
									applesauce
									peanut\ butter
									black\ cherry\ soda
									maraschino\ cherries
									pear
									Stilton
									cucumber
									dill
									avacado
									sweet\ potato
									baker's\ sugar
									lavender\ flowers
									lavender\ oil
									tangerine\ zest
									sanding\ sugar
)

ingredients_list.each do |item|
Ingredient.create(name: item)
end

measure_list = ["none (1 egg)", "pinch", "teaspoon",
								"tablespoon", "cup", "box", "bag", "pound",
								"gram", "ounce", "stick", "dash", "sprig",
								"piece", "ml"]


measure_list.each do |measure|
	Measure.create(name: measure)
end

teaspoon = %w(1/4 1/2 3/4 1 1\ 1/4 1\ 1/2 1\ 3/4 2 2\ 1/4 2\ 1/2 2\ 3/4)

teaspoon.each do |item|
	teaspoonobject = Measure.find_by_name("teaspoon")
	teaspoonobject.units.build(name: item)
	teaspoonobject.save
end
egg = (1..12).to_a

egg.each do |item|
	eggobject = Measure.find_by_name("none (1 egg)")
	eggobject.units.build(name: item)
	eggobject.save
end

tablespoon = %w(1 2 3 4 5 6 7 8 16)
tablespoon.each do |item|
	tablespoonobject = Measure.find_by_name("tablespoon")
	tablespoonobject.units.build(name: item)
	tablespoonobject.save
end

cup = %w(1/4 1/3 1/2 2/3 3/4 1 1\ 1/4 1\ 1/3 1\ 1/2 1\ 2/3 1\ 3/4 2 2\ 1/4 2\ 1/3 2\ 1/2 2\ 2/3 2\ 3/4 3 3\ 1/4 3\ 1/3 3\ 1/2 3\ 2/3 3\ 3/4 4 4\ 1/4 4\ 1/3 4\ 1/2 4\ 2/3 4\ 3/4 5)

cup.each do |item|
	cupobject = Measure.find_by_name("cup")
	poundobject = Measure.find_by_name("pound")
	cupobject.units.build(name: item)
	cupobject.save
	poundobject.units.build(name: item)
	poundobject.save
end


sticks = %w(1/4 1/2 3/4 1 2 3 4 5 6)
sticks.each do |item|
	stickobject = Measure.find_by_name("stick")
	stickobject.units.build(name: item)
	stickobject.save
end

ounces = (1..16).to_a

ounces.each do |item|
	ouncesobject = Measure.find_by_name("ounce")
	ouncesobject.units.build(name: item)
	ouncesobject.save
end




