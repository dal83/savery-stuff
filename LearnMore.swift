//
//  LearnMore.swift
//  Savery
//
//  Created by Deborah Lilly on 7/21/20.
//  Copyright © 2020 SaveryApp. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

struct LearnMoreView: View {
    private var methods: [methodItem] = [
        methodItem(
            methodName: "Farms",
        description: "\tIn the U.S., agriculture accounts for 50 percent of land use and 80 percent of the country’s consumptive water use. Regardless, every year, 20 billion pounds of food on farms is never harvested.\n\n\tFood is wasted on farms for various reasons. A farmer might plant more than consumers demand in anticipation of pests or damaging weather; the cost of transportation and labor might exceed the market price of produce; or a farmer might discard perfectly edible food due to simple cosmetic imperfections that could deter customers.\n\n\tIn the U.S., 7% of planted fields go unharvested each year due to changes in demand or pricing. Sadly, farmers don’t allow the public to harvest the leftover crops due to liability issues and food safety rules.\n\n\tSending the surplus crops to food insecure nations might seem to be a perfect solution, but doing so actually disadvantages local farmers in those nations who can’t compete with the prices. Additionally, most farmers aren’t willing to pay the cost of harvesting and shipping the leftover crops.",
            actionItems: "\tGlean! Gleaning is the act of collecting excess fresh food from a farm after a crop has been harvested. Around the U.S., volunteer groups go out to farms and collect leftover fresh food after the harvest. The food is then donated to food banks or pantries, which often lack the fresh, healthy produce the food insecure population needs most.",
        imageName: "FarmIcon",
            smallImage: "FarmIconSmall",
            links: [Link("Find a Gleaning Organization Near You", destination: (URL(string: "https://nationalgleaningproject.org/gleaning-map/")!)),
                    Link("Learn More About Food Waste and Loss on Farms", destination: (URL(string: "https://www.usda.gov/sites/default/files/documents/usda_gleaning_toolkit.pdf")!))]),
        methodItem(
        methodName: "Restaurants",
        description: "\tIn the U.S., restaurants account for an estimated 22 to 33 billion pounds of food waste each year, with food scraps constituting, on average, 60 percent of a restaurant’s dumpster contents. Some reasons for restaurant food waste and loss include oversized portions, extensive menu offerings, over-preparation of food, improper ingredient storage, and failure to use food scraps and trimmings. All-you-can-eat buffets contribute significantly to restaurant food waste, as restaurants cannot legally reuse or donate extra food from buffets due to health code restrictions. However, restaurants are constantly restocking their buffets to maintain the appearance of a flourishing offering. Additionally, diners are responsible for a significant portion of restaurant food waste: On average, 17 percent of meals are not eaten and 55 percent of major leftovers are not taken home.",
            actionItems: "\tTry to support restaurants that have ethical food waste practices!Buy food from restaurants that compost their food scraps or that make an attempt to use leftover ingredients in meals, and reach out to other restaurants to convince them to change their food waste practices.\n\n\tAdditionally, try to order the right portion size for you, while also ordering food you enjoy that won’t end up going to waste. Be sure to take home any leftovers you might have.",
        imageName: "RestaurantIcon",
            smallImage: "RestaurantIconSmall",
            links: [Link("Learn More About Restaurant Food Waste", destination: (URL(string: "https://moveforhunger.org/startling-reality-food-waste-restaurants")!))]),
        methodItem(
        methodName: "Grocery Stores",
        description: "\tU.S. supermarkets are responsible for 43 billion pounds of food waste each year, which is equivalent to 10 percent of all U.S. food waste. Supermarkets lose an estimated $15 billion annually from unsold fruits and vegetables alone. Additionally, 9 percent of bread that enters grocery stores is wasted.\n\n\tFood waste in grocery stores is largely a result of consumers’ eating preferences; supermarkets often throw out foods that are slightly bruised or misshapen, even if they’re perfectly edible. The U.K. food chain Sainsbury’s combats the waste of cosmetically imperfect foods by selling these “ugly” foods at a discount.\n\n\tSupermarkets also waste food trying to fulfill customers’ desire for perfectly fresh and fully stocked shelves. We love abundance—you probably wouldn’t want to walk into a supermarket with near-empty displays. Additionally, the average U.S. grocery store pulls $2,300 worth of out-of-date food off the shelves every day, even though most of this food is perfectly edible. Some stores even pull foods off their shelves before their expiration dates because food nearing its expiration date seems less appealing to consumers. Speaking of expiration dates, many supermarkets waste food because of the confusion around sell-by, best-by, and use-by dates (they’re not all the same!).\n\n\tWhile supermarkets could donate to food banks, many choose not to do so because they fear liability or simply do not want their brands to be displayed in underprivileged settings. However, the Bill Emerson Good Samaritan Food Donation Act protects U.S. stores that donate in good faith from liability.\n\n\tSome grocers have also diverted food from landfills by sending food waste to composters or anaerobic digestion facilities instead. Sainsbury’s has not sent any food waste to landfills since 2013.",
        actionItems: "\tFirstly, you can try to shop at any supermarkets near you that have ethical food waste practices, like Sainsbury’s. Also, shopping at local stores and farmer’s markets can help cut down on carbon emissions. Regardless of the grocery store at which you shop, try to buy the cosmetically imperfect foods that other customers probably won’t buy, and remember that sell-by/best-by/use-by dates are often very misleading.\n\n\tYou can also reach out to your local grocery stores and advocate for adoption of zero-waste practices. Additionally, a handful of states and cities in the U.S. have passed laws aimed at reducing food waste by large food retailers. For instance, Massachusetts established a solid waste disposal ban, which applies to businesses and institutions that dispose of more than one ton of food waste per week. Reach out to your government officials to enact similar laws in your jurisdiction!",
        imageName: "GroceryIcon",
            smallImage: "GroceryIconSmall",
            links: []),
        methodItem(
        methodName: "Home",
        description: "\tU.S. households are responsible for 76 billion pounds of food waste each year, with the average family of four wasting $2,200 each year in squandered groceries. Approximately 40 to 50 percent of food waste happens at the consumer level, with produce accounting for 35 to 40 percent of household food waste. Several reasons account for the high volume of household food waste. Food spoilage, over-preparation of food, date label confusion, overbuying, and poor planning are some of the major contributors to household food waste.",
        actionItems: "\t◦\tPrevent your food from spoiling by finding the best preserving methods (cooling, canning, drying, dehydrating, etc.) for your food.\n\t◦\tSome places, such as Vermont, have enacted food waste bans that prevent household food waste from being sent to landfills. Reach out to your representatives to see if you can enact a similar law in your jurisdiction!\n\t◦\tMake sure you're not overpacking your fridge or forgetting those foods that somehow slip into the very back of the cupboard.\n\t◦\tTry not to prepare more food than you or your guests will actually eat. If you have leftovers, store them instead of throwing them away.\n\t◦\tExpiration dates are often very misleading. “Sell by” and “use by” dates are not federally regulated and only serve as manufacturer suggestions for when a food is at peak quality. Use your own judgement of a food’s quality (smell, taste, color, etc.) before giving in to the expiration label.\n\t◦\tMake a grocery list and stick to it. Also try to avoid useless deals, such as cheaper prices when buying in bulk, if the deal will actually result in food waste.\n\t◦\tPlan out your meals ahead of time. Try to incorporate the same ingredient in multiple recipes. This will allow you to make the most of food you already have in your kitchen.\n\t◦\tHave food that seems past its prime? You can probably incorporate it into a recipe—click below to find recipes!",
        imageName: "HomeIcon",
            smallImage: "HomeIconSmall",
            links: [Link("Find Recipes", destination: (URL(string: "https://www.allrecipes.com/")!)), Link("Learn More About Household Food Waste Reduction", destination: (URL(string: "https://www.epa.gov/recycle/reducing-wasted-food-home")!))]),
        methodItem(
        methodName: "Donate",
        description: "\tAfter source reduction, donation of excess food is the second tier of the EPA’s Food Recovery Hierarchy. With approximately 30 to 40 percent of the food supply in the U.S. going to waste, it’s shocking that around 13.7 million households (10.5 percent of all U.S. households) struggle with food insecurity. While some food banks and pantries receive ample donations, the foods received often lack nutritional value, and pantries rarely acquire a sufficient amount of produce and meat.",
        actionItems: "\tMany food banks and food pantries accept food donations from individuals. Before delivering any food to food banks or pantries, make sure to confirm with them to see what type of food they will accept (they will often only accept nonperishable items). Donate any nonperishable food items from your pantry or host a local food drive!\n\n\tHowever, you might want to think twice before purposefully purchasing food at the grocery store to then donate. Often, donating money can have a larger impact than just donating nonperishable food. Food banks work directly with major manufacturers, retailers, and farmers, which means that food banks can provide more meals with less money, and they can work to provide healthier options (such as produce and proteins) that you wouldn’t otherwise be able to donate. Additionally, by working directly with farmers, food banks can redirect farm food loss to those who are in need.",
        imageName: "DonateIcon",
            smallImage: "DonateIconSmall",
            links: [Link("Find a Food Bank or Pantry Near You", destination: (URL(string: "https://ampleharvest.org/find-pantry/")!)), Link("Learn More About Donating Money Over Food", destination: (URL(string: "https://www.feedingamerica.org/hunger-blog/donating-food-food-bank-consider-cash-instead-canned-goods")!))]),
        methodItem(
        methodName: "Animal Feed",
        description: "\tThe EPA lists feeding animals as the third tier of the Food Recovery Hierarchy. 33 percent of croplands are used to produce feed for livestock, requiring massive amounts of land, water, and energy. In the U.S., 60 percent of the corn produced is used to feed livestock. Livestock are responsible for 7 percent of global greenhouse gas emissions, and lead to large swaths of deforestation in order to grow feed.",
        actionItems: "\tMany animal feed companies work directly with businesses and institutions to direct food waste toward conversion to animal feed. Unfortunately, it is difficult for the average consumer to donate food scraps for animal feed due to heavy legal restrictions. However, a variety of food scraps can be fed to many pets, including dogs, cats, chickens, and pigs—start turning food scraps into animal feed by first researching which foods are suitable for your pet to consume.",
        imageName: "AnimalFeedIcon",
            smallImage: "AnimalFeedIconSmall",
            links: [Link("Learn More About Feeding Food Waste to Animals", destination: (URL(string: "https://www.epa.gov/sustainable-management-food/reduce-wasted-food-feeding-animals")!))]),
        methodItem(
        methodName: "Industrial Uses",
        description: "\tThe third tier of the EPA’s Food Recovery Hierarchy pertains to harnessing food waste to create biofuel and bio-products.\n\n\tOne of the most common industrial processes is anaerobic digestion, by which bacteria break down organic materials in the absence of oxygen. A product of this process is biogas, a renewable energy which can be used to generate electricity, heat, and transportation fuel.\n\n\tOverall, industrial uses of food scraps are environmentally friendly, cost-effective, and provide good alternative energy sources.",
        actionItems: "\tAnaerobic digestion requires large, complex facilities. You can reach out to your local and state government officials to request that your city/county/state invest in an anaerobic digestion plant.\n\n\tWhile these facilities are less common in the U.S., the U.K. has invested in around 580 anaerobic digestion plants that provide renewable energy to U.K. consumers. In fact, at the Sainsbury’s in Cannock, England, the entire grocery store’s electricity is generated by anaerobic digestion.\n\n\tWhile these anaerobic digestion facilities are expensive, they are definitely worth the cost.",
        imageName: "BiofuelIcon",
            smallImage: "BiofuelIconSmall",
            links: [Link("Learn More About Anaerobic Digestion", destination: (URL(string: "https://www.epa.gov/anaerobic-digestion/basic-information-about-anaerobic-digestion-ad")!)), Link("Learn More About Industrial Uses of Food Waste", destination: (URL(string: "https://www.epa.gov/sustainable-management-food/industrial-uses-wasted-food")!))]),
        methodItem(
        methodName: "Compost",
        description: "\tComposting is the natural process of decomposing organic matter to nourish the soil.\n\n\tNot only is composting an environmentally-conscious alternative to sending food to landfills, but it can also improve plant health and reduce the need for harmful chemical fertilizers.\n\n\tThe EPA estimates that in 2018, 4.1 percent of wasted food was composted.",
        actionItems: "Backyard composting:\n\n\tCreating a backyard compost pile is pretty simple! Find a dry, shady spot to hold the pile. A good quality compost pile will include an equal amount of browns (e.g., dead leaves, branches, and twigs) and greens (e.g., vegetable and fruit scraps, coffee grounds, and grass clippings). The pile should also have water in order to maintain enough moisture to break down organic matter. You can cover the pile with a tarp to speed up the decomposition process. Most foods are compostable, but you should avoid composting meats, dairy, and fats. After anywhere from two months to two years, the bottom of the compost pile should be a dark and rich color, meaning it's ready to use!\n\nIndoor composting:\n\n\tIf you’re unable to maintain an outdoor compost pile, an indoor composting kit works just as well! Any food you can put into an outdoor compost pile is usually suitable for an indoor compost bin as well. The easiest indoor composting method uses a worm bin, also known as vermicomposting. However, if you are uncomfortable with using worms, there are alternatives that also work well, such as aerobic composting or the Bokashi method. You can either purchase an indoor composting bin or construct your own (click on the links below for further instruction).\n\nExternal services:\n\n\tAnother great option to compost food is to sign up for a collection service, although these services can be on the expensive side. Once the food has been converted to compost, some collection services will even provide bags of compost for your garden. For a cheaper option, some cities provide residential compost drop-offs, usually at a transfer station. Look online to see if your city provides a space for you to drop off food scraps!",
        imageName: "CompostIcon",
            smallImage: "CompostIconSmall",
            links: [Link("Learn To Create an Indoor Worm Bin", destination: (URL(string: "https://www.epa.gov/recycle/how-create-and-maintain-indoor-worm-composting-bin")!)), Link("Learn About Different Indoor Compost Bins", destination: (URL(string: "https://hellonest.co/indoor-composting/")!)), Link("Find a Composting Service Near You", destination: (URL(string: "https://compostnow.org/compost-services/")!))])
    ]

    var buttonSpecifics = [[0, 1], [2, 3], [4, 5], [6, 7]]
    
    private var paleGreen = Color(red: 244/255, green: 252/255, blue: 235/255)
    private var darkGreen = Color(red: 163/255, green: 194/255, blue: 131/255)
    private var lightGreen = Color(red: 186/255, green: 209/255, blue: 161/255)
    private let CUSTOM_FONT = "Helvetica Neue Light"
    private let titles = ["Food waste prevention", "Where should food waste go?"]
    private let range = [0, 2]
    private let r = [2, 4]
    private let TEXT_SIZE_FACTOR: CGFloat = 0.032
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(self.darkGreen)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ScrollView {
                        VStack{
                            if (self.methods.count > 7) {
                                VStack (spacing: geometry.size.width * 0.012) {
                                    ForEach(0 ..< 2, id:\.self) { t in
                                        VStack (spacing: geometry.size.width * 0.012) {
                                            Text(self.titles[t])
                                                .font(Font.custom("Helvetica-Neue", size: geometry.size.height * self.TEXT_SIZE_FACTOR))
                                                .foregroundColor(self.darkGreen)
                                                .padding(geometry.size.width * 0.03)
                                                .frame(width: geometry.size.width)
                                                .background(Rectangle()
                                                    .fill(self.paleGreen))
                                                .padding(.bottom, geometry.size.width * 0.012)
                                            
                                            ForEach(self.buttonSpecifics[Int(self.range[t]) ..< Int(self.r[t])], id:\.self) { row in
                                                HStack {
                                                    LearnMoreFormat(row: row, geoW: geometry.size.width, geoH: geometry.size.height, methods: self.methods)
                                                }
                                            }
                                        }
                                        .padding(.bottom, geometry.size.width * 0.012)
                                    }
                                }
                            } else {
                                HStack {
                                    Text("Loading...")
                                }
                            }
                        }.frame(width: geometry.size.width)
                    }.frame(width: geometry.size.width)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                        Spacer()
                    }
                }
            }
        
        }
        /*.onAppear() {
            db.collection("Learn More").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print ("error fetching")
                    return
                }
                let name = documents.map { $0["name"]! }
                let description = documents.map { $0["description"]! }
                //let link = documents.map { $0["link"]! }
                for i in 0..<name.count {
                    self.methods.append(methodItem(
                        methodName: name[i] as? String ?? "",
                        description: (description[i] as AnyObject).replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\t", with: "\t\t"),
                        imageName: "HomeIcon"))
                        //linkOne: link[i] as? String
                    print(self.methods)
                }
            }
            self.buttonSpecifics = [[0, 1], [2, 3], [4, 5], [6, 7]]
        }*/
        .navigationBarTitle("Learn More")
        .navigationBarHidden(false)

        
    }
}

