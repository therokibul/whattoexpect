import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trimester Info'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              Card(
                child: ListTile(
                    title: Text('First Trimester Diet Plan'),
                    subtitle: Text(
                      "\n"
                      "Your first trimester is when your baby’s nervous system is developing which calls for foods that are rich in iron, vitamin B6, and folate. Plus, this is also the time when you’ll experience morning sickness or nausea, so what you eat is important. Let’s take a look:\n\n"
                      "● Fruits – Fruits are a blessing in pregnancies. You can have fresh or frozen fruit or even fresh juice. If you’re having canned juice, ensure it is 100% natural fruit juice. This will keep your body hydrated and maintain nutrition levels.\n"
                      "● Vegetables – Choose from vegetables such as spinach, broccoli, sweet potatoes, corn, yellow and red peppers, and tomatoes. These are rich sources of calcium, magnesium, iron, potassium, and fiber.\n"
                      "● Dairy Foods – To get sufficient calcium intake, drink milk and have cheese and yogurt.\n"
                      "● Whole Grains – Whole-grain food items such as bread, cereals, pasta can help you get essential carbohydrates which is the main source of energy for your body.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
              ),
              Card(
                child: ListTile(
                  title: Text('Second Trimester Diet Plan'),
                  subtitle: Text(
                    "\n"
                    "Your second trimester is when your baby’s bones and teeth are developing which calls for foods that are rich in calcium and vitamin D. Magnesium and omega-3 rich foods are also included here for the healthy brain development of your baby. Let’s take a look:\n\n"
                    "● Fruits – Fruits like peaches, mangoes, and baby carrots are great. Fresh juices made of seasonal fruits, especially orange juice, is highly recommended. This helps maintain folic acid and vitamin D levels in the body.\n"
                    "● Vegetables – Choose from vegetables such as broccoli, green beans, carrots, cabbage, and okra to add to your diet. These are rich in magnesium and calcium, so try not to overcook them to retain their nutrients. Stir-frying or steam may be good alternatives.\n"
                    "● Dried Fruit – Dry fruits such as apricots, figs, and dates are great options for healthy snacking during pregnancy. Plus, they contain calcium and iron.\n"
                    "● Whole Grains – To keep your body full of energy, carbohydrates are still essential this semester. Add fortified bread, brown rice, and cereals to your diet to get your dose of carbs.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Third Trimester Diet Plan'),
                  subtitle: Text(
                    "\n"
                    "Third Trimester Diet PlanVitamin K is an important vitamin at this time as it helps blood to clot which is needed during birth and breastfeeding. And your third-trimester diet plan includes dishes that give you just that! In this trimester, iron is essential to ensure healthy birth weight and prevent premature delivery whereas zinc helps to produce enzymes and insulin. Let’s take a look:\n"
                    "● Protein – Protein-rich foods are super important. Pick your choice of meat and have it grilled for dinner along with some stewed green veggies like beans or salad. This will boost your intake of protein, iron, and zinc.\n"
                    "● Eggs – From scrambled eggs for breakfast to hard-boiled ones, eggs can be your healthy snacking option. They are rich in zinc, and vitamins like A, D, and B complex which are required during and after pregnancy.\n"
                    "● Vitamin C – Vitamin C helps to develop the baby’s immune system so ensure you are eating plenty of fruits and vegetables that are rich in vitamin C.\n"
                    "● Vitamin A – Vitamin A helps to support proper bone and tooth development along with DNA formation. So, you must add foods rich in vitamin A to your diet plan.\n"
                    "Remember, as your trimesters progress, your baby’s growth speeds up, causing you to gain weight rapidly. But, as long as you are eating a well-balanced and healthy diet, there’s nothing to worry about! Eating right will not only boost your immunity but also ensure you have a healthy and happy pregnancy. It’s also advisable to consult a doctor or a health practitioner before making any major changes to your diet plan, or before taking additional supplements.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
