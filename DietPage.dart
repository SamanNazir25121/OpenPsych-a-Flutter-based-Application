// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  DietPage({Key? key}) : super(key: key);

  // Define a list of pictures and descriptions
  final List<Map<String, String>> dietItems = [
    {
      'title': 'Whole Grain',
      'description':
          'Whole grains offer significant benefits for mental health owing to their rich nutrient content. They are abundant in B vitamins, magnesium, and zinc, which play crucial roles in the production and regulation of neurotransmitters in the brain, influencing mood, cognitive function, and emotional well-being. Additionally, their low glycemic index leads to a gradual release of glucose into the bloodstream, promoting stable blood sugar levels and preventing mood swings. The high dietary fiber content in whole grains fosters a healthy gut microbiome, which has been associated with positive effects on mood and cognitive performance. Moreover, the antioxidants present in whole grains combat oxidative stress and inflammation, protecting the brain from potential damage. Improved cardiovascular health resulting from whole grain consumption ensures optimal blood flow to the brain, supporting cognitive function and mood regulation. When combined with other healthy lifestyle factors, incorporating whole grains into ones diet can be an essential component of a balanced approach to support mental well-being.',
      'imagePath': 'images/whole-grains.jpeg', // Update with actual image path
    },
    // Add more items with their respective titles, descriptions, and image paths here
    {
      'title': 'Olive Oil',
      'description':
          'Olive oil, a staple in the Mediterranean diet, has been linked to several mental health benefits. This heart-healthy oil is rich in monounsaturated fats, which have been associated with a reduced risk of depression and cognitive decline. The presence of antioxidants, particularly polyphenols, in olive oil helps combat oxidative stress and inflammation in the brain, protecting neurons from damage. Moreover, these polyphenols have shown potential in enhancing memory and learning abilities. The consumption of olive oil has also been linked to improvements in mood and emotional well-being, possibly due to its positive effects on the production and regulation of neurotransmitters in the brain. Additionally, the anti-inflammatory properties of olive oil may contribute to a healthier gut microbiome, fostering a connection between gut health and mental health. Incorporating olive oil into ones diet, along with a balanced approach to nutrition, may play a supportive role in promoting mental well-being.',
      'imagePath': 'images/OliveOil.jpeg', // Update with actual image path
    },
    {
      'title': 'Beans',
      'description':
          'Beans, a versatile and nutrient-dense food, offer several benefits for mental health. They are an excellent source of complex carbohydrates, providing a steady release of glucose into the bloodstream, which supports stable energy levels and mood regulation. Additionally, beans are rich in B-vitamins, particularly folate, which play a crucial role in the synthesis of neurotransmitters like serotonin and dopamine, impacting mood and emotional well-being. Moreover, the high fiber content in beans promotes a healthy gut microbiome, and emerging research suggests a strong connection between gut health and mental health. The presence of antioxidants in beans helps combat oxidative stress and inflammation in the brain, protecting neurons from potential damage. Including beans in a balanced diet may contribute to improved cognitive function, mood stability, and overall mental well-being.',
      'imagePath': 'images/Beans.jpeg', // Update with actual image path
    },
    {
      'title': 'Omega 3 Fatty Acids',
      'description':
          'Omega-3 fatty acids play a crucial role in supporting mental health and cognitive function. These essential fats are vital components of cell membranes in the brain and are involved in various brain processes. The two primary types of omega-3 fatty acids found in fish oil are eicosapentaenoic acid (EPA) and docosahexaenoic acid (DHA). Studies have shown that EPA and DHA have anti-inflammatory properties, which can help reduce inflammation in the brain and support overall brain health. Additionally, omega-3 fatty acids have been linked to improved mood and reduced symptoms of depression and anxiety. They are also essential for brain development in infants and children, making them critical for optimal brain function throughout life. Including sources of omega-3 fatty acids, such as fatty fish, flaxseeds, chia seeds, and walnuts, in the diet can have significant benefits for mental well-being and cognitive performance.',
      'imagePath': 'images/omega3.jpeg', // Update with actual image path
    },
    {
      'title': 'Walnuts',
      'description':
          'Walnuts, often referred to as "brain food," offer numerous benefits for mental health. Packed with omega-3 fatty acids, walnuts play a vital role in brain function and development. These essential fats are known to support cognitive processes, enhance memory, and improve mood by reducing inflammation in the brain. Furthermore, walnuts contain antioxidants, such as vitamin E, which protect brain cells from oxidative stress and potential damage caused by free radicals. The presence of polyphenols and other neuroprotective compounds in walnuts further contributes to their positive impact on mental well-being. Incorporating walnuts into the diet may help promote a healthy mind, enhance cognitive abilities, and provide valuable nutrients that support overall mental health.',
      'imagePath': 'images/walnuts.jpeg', // Update with actual image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPEN PSYCH'),
      ),
      body: ListView.builder(
        itemCount: dietItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  dietItems[index]['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                // Use an Image widget with the actual image path
                Image.asset(
                  dietItems[index]['imagePath']!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Text(
                  dietItems[index]['description']!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16), // Add space after each description
              ],
            ),
          );
        },
      ),
    );
  }
}
