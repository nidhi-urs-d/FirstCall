
//  InstructionData.swift
//  FirstCall
//
//  Created by NIDHI URS  on 23/02/26.
//

import Foundation
import SwiftUI
struct EmergencyCategory: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let emergencies: [Instruction]
}

struct InstructionData {
    
    // MARK: - 1. YOGA
    static let yoga: [Instruction] = [
        Instruction(
            name: "Tadasana (Mountain Pose)",
            icon: "figure.stand",
            doSteps: [
                "1. Stand with feet together and arms at sides.",
                "2. Distribute weight evenly across both feet.",
                "3. Engage thigh muscles and lift kneecaps.",
                "4. Lengthen spine and relax shoulders.",
                "5. Breathe deeply and hold for 30 seconds."
            ],
            dontSteps: [
                "Do not lock your knees.",
                "Do not tense shoulders.",
                "Do not lean forward or backward."
            ],
            benefits: [
                "Improves posture.",
                "Enhances balance.",
                "Strengthens legs and core."
            ],
            
            voiceEnabled: true
        ),
        Instruction(
            name: "Bhujangasana (Cobra Pose)",
            icon: "figure.yoga",
            doSteps: [
                "1. Lie flat on stomach.",
                "2. Place palms under shoulders.",
                "3. Inhale and lift chest upward.",
                "4. Keep elbows slightly bent.",
                "5. Hold for 15-20 seconds."
            ],
            dontSteps: [
                "Do not overextend lower back.",
                "Do not lift hips off the ground."
            ],
            benefits: [
                "Strengthens spine.",
                "Improves lung capacity.",
                "Reduces stress."
            ],
            
            voiceEnabled: true
        ),
        Instruction(
            name: "Adho Mukha Svanasana (The Inverted Fold)",
            icon: "figure.yoga",
            doSteps: [
                "1. Begin on hands and knees in a tabletop position.",
                "2. Spread fingers wide and press firmly through the knuckles.",
                "3. Exhale and lift the sit-bones toward the ceiling.",
                "4. Pedal your feet if your hamstrings feel tight, gradually reaching heels toward the floor.",
                "5. Keep the neck relaxed, with ears aligned with the upper arms."
            ],
            dontSteps: [
                "Do not round your upper back.",
                "If your back curves, do not lock your knees - bend them to keep the spine straight."
            ],
            benefits: [
                "Decompresses the spine.",
                "Builds upper-body endurance."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Bhujangasana (The Rising Cobra)",
            icon: "figure.yoga",
            doSteps: [
                "1. Lie face down with the tops of the feet pressing firmly into the mat.",
                "2. Place hands directly under the shoulders.",
                "3. Inhale and use your mid-back muscles to gently peel the chest off the floor.",
                "4. Keep the elbows tucked tightly against your ribs.",
                "5. Gaze at the floor about 3 feet in front of you to maintain a neutral neck."
            ],
            dontSteps: [
                "Do not straighten your arms completely if it causes pinching in the lower back.",
                "Never jerk the neck upward."
            ],
            benefits: [
                "Strengthens the posterior chain.",
                "Counteracts slumping from prolonged desk work."
            ],
            
            voiceEnabled: true
        ),
        Instruction(
            name: "Vrikshasana (The Rooted Tree)",
            icon: "figure.yoga",
            doSteps: [
                "1. Shift your weight to the left leg, finding a strong rooting sensation through the foot.",
                "2. Place the right sole on the left inner calf or inner thigh (avoid the knee).",
                "3. Fix your gaze on a non-moving point (Drishti) to maintain stability.",
                "4. Draw your belly in gently and lengthen the tailbone downward."
            ],
            dontSteps: [
                "Never place your foot on the side of the knee.",
                "Do not let the standing hip collapse outward."
            ],
            benefits: [
                "Fortifies the standing ankle.",
                "Enhances neurological focus and balance."
            ],
            
            voiceEnabled: true
        ),
        Instruction(name: "Paschimottanasana (The Posterior Stretch)", icon: "waveform.path.ecg",
                    doSteps: ["1. Sit with legs straight, feet flexed toward your face. ",
                              "2. Inhale: Reach both arms up, creating space in the torso.",
                              "3. Exhale: Lead with the chest as you fold.",
                              "4. Hold your shins, ankles, or feet—whichever is accessible without straining."
                             ],
                    dontSteps: ["Do not pull your head toward your knees by force. Keep the stretch focused on the hamstrings, not the neck."],
                    benefits: ["Stimulates the kidneys and liver while cooling the nervous system."],
                    voiceEnabled: true
                   ),
        
        Instruction(name: "Setu Bandhasana (The Structural Bridge)", icon: "person.fill.checkmark",
                    doSteps: ["1. Lie on your back, knees bent, feet hip-width apart and close to the glutes.",
                              "2. Inhale: Press through the heels to lift the pelvis.",
                              "3. Roll your shoulders underneath you and interlace your fingers.",
                              "4. Keep the thighs parallel; do not let the knees \"flare.\""],
                    dontSteps: ["Do not turn your head to look around while lifted. This can cause severe cervical vertebrae injury"],
                    benefits: ["Energizes the heart and relieves chest congestion"],
                    
                    voiceEnabled: true
                   ),
        
        Instruction(name: "Balasana (The Resting Embryo)", icon: "person.fill.checkmark",
                    doSteps: ["1. Kneel and sit back on your heels.",
                              "2. Separate your knees as wide as the mat while keeping big toes together.",
                              "3. Exhale: Fold forward, resting your forehead on the floor or a block. ",
                              "4. Breathe deeply into the back of your ribcage."],
                    dontSteps: ["Do not force your forehead down if it causes hip pain. Use a cushion for support."],
                    benefits: ["A vital \"reset\" pose that triggers the parasympathetic nervous system."],
                    
                    voiceEnabled: true
                   ),
        
        
        Instruction(name: "Pranayama (Breath Regulation) : Nadi Shodhana (Channel Purification / Anulom Vilom)", icon: "person.fill.checkmark",
                    doSteps: ["1. Sit in an upright, meditative posture. ",
                              "2. Use the right thumb to close the right nostril; inhale through the left.",
                              "3. Close the left nostril with the ring finger; exhale through the right. ",
                              "4. Inhale right, then exhale left. Continue this pattern for 5 minutes."],
                    dontSteps: ["Do not use a digital or \"pumping\" breath. It must be a fluid, nearly silent stream of air."],
                    benefits: ["Restores equilibrium between the \"Sun\" (Active) and \"Moon\" (Passive) energies."],
                    
                    voiceEnabled: true
                   ),
        
        Instruction(name: "Pranayama (Breath Regulation) : Kapalbhati (The Frontal Brain Cleansing)", icon: "person.fill.checkmark",
                    doSteps: [
                        "1. Sit tall. Take a deep, natural breath in. Allow your belly to expand.",
                        "2. Exhale: Contract the lower abdomen sharply, forcing air out through the nostrils. ",
                        "3. Relax the abdomen; the inhalation will happen naturally and silently. ",
                        "4. Aim for rhythmic \"pulses\" of breath."],
                    dontSteps: ["Do not use a digital or \"pumping\" breath. It must be a fluid, nearly silent stream of air."],
                    benefits: ["Clears the nasal passages and ignites the \"digestive fire.\""],
                    
                    voiceEnabled: true
                   ),
        Instruction(name: "Pranayama (Breath Regulation) : Bhramari (The Vibrational Bee Breath)", icon: "person.fill.checkmark",
                    doSteps: [
                        "1. Use your thumbs to gently block the ear canals (Tragus).",
                        "2. Close your eyes and inhale slowly.",
                        "3. Exhale: Produce a smooth, high-pitched \"M\" sound until the lungs are empty.",
                        "4. Feel the vibration echoing through the skull."
                    ],
                    dontSteps: ["Do not hum if you feel dizzy or have a severe ear infection"],
                    benefits: ["Instantly lowers the heart rate and mitigates acute stress"],
                    
                    voiceEnabled: true
                   )
    ]
    
    // MARK: - 2. EXERCISE
    static let exercise: [Instruction] = [
        Instruction(
            name: "Push-Ups",
            icon: "figure.strengthtraining.traditional",
            doSteps: [
                "1. Place hands shoulder-width apart.",
                "2. Keep body straight.",
                "3. Lower chest toward ground.",
                "4. Push back up slowly."
            ],
            dontSteps: [
                "Do not arch lower back.",
                "Do not flare elbows excessively."
            ],
            benefits: [
                "Strengthens chest and arms.",
                "Builds core strength."
            ],
            
            voiceEnabled: true
        ),
        Instruction(
            name: "Bodyweight Squat",
            icon: "figure.strengthtraining.traditional",
            doSteps: [
                "1. Stand with feet shoulder-width apart, toes slightly pointed outward.",
                "2. Inhale and lower your hips back and down as if sitting in an invisible chair.",
                "3. Keep your chest upright and maintain a neutral spine.",
                "4. Exhale and press through your heels to return to a standing position.",
                "5. Keep your weight distributed evenly through your heels."
            ],
            dontSteps: [
                "Do not let your knees cave inward.",
                "Do not round your lower back.",
                "Do not shift your weight onto your toes."
            ],
            benefits: [
                "Strengthens quadriceps, glutes, and hamstrings.",
                "Improves core stability.",
                "Enhances lower body mobility and balance."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Standard Push-Ups",
            icon: "figure.strengthtraining.traditional",
            doSteps: [
                "1. Start in a high plank position with hands slightly wider than shoulder-width.",
                "2. Keep your body in a straight line from head to heels.",
                "3. Inhale and lower your body until your chest nearly touches the floor.",
                "4. Keep your elbows at a 45-degree angle to your torso.",
                "5. Exhale and push back up to the starting position.",
                "6. If needed, modify by dropping to your knees while maintaining a straight line from head to knees."
            ],
            dontSteps: [
                "Do not let your hips sag toward the floor.",
                "Do not lift your hips too high.",
                "Do not flare your elbows outward excessively.",
                "Do not look straight ahead; keep your neck neutral."
            ],
            benefits: [
                "Builds chest, shoulder, and tricep strength.",
                "Improves core endurance and stability.",
                "Enhances overall upper body muscular control."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Plank (Core Stabilization)",
            icon: "figure.core.training",
            doSteps: [
                "1. Place your forearms on the floor with elbows directly under your shoulders.",
                "2. Extend your legs back and balance on your toes.",
                "3. Create a straight line from your head to your heels.",
                "4. Engage your core and squeeze your glutes.",
                "5. Hold the position for 30 to 60 seconds while breathing in short, controlled breaths."
            ],
            dontSteps: [
                "Do not hold your breath.",
                "Do not arch your lower back.",
                "Do not let your hips sag toward the floor.",
                "Do not lift your hips too high."
            ],
            benefits: [
                "Strengthens deep abdominal muscles.",
                "Improves posture and spinal stability.",
                "Enhances overall core endurance."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Alternating Lunges",
            icon: "figure.walk",
            doSteps: [
                "1. Stand tall with feet hip-width apart.",
                "2. Take a large step forward with your right leg.",
                "3. Lower your hips until both knees are bent at approximately 90 degrees.",
                "4. Keep your front knee directly above your ankle.",
                "5. Keep your torso upright throughout the movement.",
                "6. Push off the front foot to return to the starting position.",
                "7. Repeat on the opposite leg."
            ],
            dontSteps: [
                "Do not let your front knee extend past your toes.",
                "Do not let your back knee slam into the floor.",
                "Do not lean your torso forward excessively."
            ],
            benefits: [
                "Enhances balance and coordination.",
                "Improves hip mobility.",
                "Builds unilateral leg strength in quadriceps and glutes."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Burpees",
            icon: "figure.highintensity.intervaltraining",
            doSteps: [
                "1. Start from a standing position with feet shoulder-width apart.",
                "2. Drop into a squat and place your hands firmly on the floor.",
                "3. Kick your feet back into a strong plank position.",
                "4. Keep your core engaged and body in a straight line.",
                "5. Jump your feet back toward your hands to return to a squat.",
                "6. Explode upward into a vertical jump with arms reaching overhead.",
                "7. Land softly on your feet and immediately transition into the next repetition."
            ],
            dontSteps: [
                "Do not let your lower back dip during the plank phase.",
                "Do not skip proper plank alignment.",
                "Do not land stiff-legged; avoid hard impact on joints."
            ],
            benefits: [
                "Provides a full-body workout.",
                "Improves cardiovascular endurance.",
                "Burns high calories efficiently.",
                "Builds strength and explosive power."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Mountain Climbers",
            icon: "figure.run",
            doSteps: [
                "1. Start in a high plank position with hands directly under your shoulders.",
                "2. Keep your body in a straight line from head to heels.",
                "3. Drive your right knee toward your chest quickly.",
                "4. Switch legs, bringing the left knee forward while extending the right leg back.",
                "5. Continue alternating legs in a fast, controlled running motion.",
                "6. Keep your hips low and core engaged throughout the movement."
            ],
            dontSteps: [
                "Do not bounce your hips up and down.",
                "Do not let your lower back sag.",
                "Do not place your hands too far forward.",
                "Do not sacrifice form for speed."
            ],
            benefits: [
                "Increases heart rate and improves cardiovascular endurance.",
                "Strengthens lower abdominal muscles.",
                "Builds shoulder stability and core coordination."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Jumping Jacks",
            icon: "figure.jumprope",
            doSteps: [
                "1. Stand upright with feet together and arms resting at your sides.",
                "2. Jump while spreading your legs slightly wider than shoulder-width.",
                "3. Simultaneously raise your arms overhead and clap your hands.",
                "4. Jump again to return to the starting position.",
                "5. Land softly on the balls of your feet for better shock absorption.",
                "6. Perform the exercise on a mat or slightly soft surface if you have joint sensitivity."
            ],
            dontSteps: [
                "Do not land flat-footed.",
                "Do not lock your knees during landing.",
                "Do not swing your arms without control."
            ],
            benefits: [
                "Improves coordination and rhythm.",
                "Increases heart rate and blood circulation.",
                "Serves as an effective full-body warm-up."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Glute Bridges",
            icon: "figure.strengthtraining.traditional",
            doSteps: [
                "1. Lie on your back with knees bent and feet flat on the floor, hip-width apart.",
                "2. Place your arms by your sides with palms facing down.",
                "3. Keep your feet parallel and aligned with your knees.",
                "4. Exhale and lift your hips toward the ceiling by squeezing your glutes.",
                "5. Create a straight line from shoulders to knees at the top.",
                "6. Hold the top position for 2 seconds while keeping your core engaged.",
                "7. Inhale and slowly lower your hips back to the floor with control."
            ],
            dontSteps: [
                "Do not push from your lower back.",
                "Do not let your knees flare outward.",
                "Do not overarch your spine at the top position."
            ],
            benefits: [
                "Strengthens and activates the glute muscles.",
                "Improves hip stability and core support.",
                "Helps counteract tight hips caused by prolonged sitting."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Bird-Dog",
            icon: "figure.core.training",
            doSteps: [
                "1. Start on all fours in a tabletop position with wrists under shoulders and knees under hips.",
                "2. Keep your spine neutral and core gently engaged.",
                "3. Simultaneously extend your right arm forward and your left leg backward.",
                "4. Keep your back flat, as if balancing a glass of water on it.",
                "5. Hold the position for 3 seconds while breathing steadily.",
                "6. Return to the starting position with control.",
                "7. Switch sides and repeat."
            ],
            dontSteps: [
                "Do not lift your leg above hip level.",
                "Do not arch or sag your lower back.",
                "Do not rush the movement."
            ],
            benefits: [
                "Improves balance and coordination.",
                "Strengthens core stabilizing muscles.",
                "Enhances spinal stability and posture."
            ],
            voiceEnabled: true
        ),
        Instruction(
            name: "Cat-Cow Stretch",
            icon: "figure.cooldown",
            doSteps: [
                "1. Start on all fours with wrists under shoulders and knees under hips.",
                "2. Keep your spine neutral and core relaxed.",
                "3. Inhale and move into Cow Pose by dropping your belly toward the mat and lifting your chest and gaze upward.",
                "4. Exhale and move into Cat Pose by rounding your spine toward the ceiling and tucking your chin to your chest.",
                "5. Continue flowing slowly between Cow and Cat while synchronizing each movement with your breath."
            ],
            dontSteps: [
                "Do not rush the movement.",
                "Do not force the range of motion.",
                "Do not continue if you feel sharp pinching in the spine."
            ],
            benefits: [
                "Improves flexibility of the spine.",
                "Releases tension in the neck and shoulders.",
                "Enhances spinal mobility and posture.",
                "Promotes relaxation through breath synchronization."
            ],
            voiceEnabled: true
        )
        
        
    ]
    
    // MARK: - 3. MEDICAL
    static let medical: [Instruction] = [
        Instruction(
            name: "Heart Attack",
            icon: "heart.fill",
            doSteps: [
                "1. Call emergency services immediately.",
                "2. Help the person sit down and stay calm.",
                "3. Loosen any tight clothing.",
                "4. If conscious and not allergic, give one adult Aspirin to chew and swallow.",
                "5. If they lose consciousness and stop breathing, begin CPR immediately."
            ],
            dontSteps: [
                "Do not leave the person alone.",
                "Do not let them drive themselves to the hospital.",
                "Do not wait to see if symptoms go away."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Stroke",
            icon: "brain.head.profile",
            doSteps: [
                "1. Call emergency services immediately and note the time symptoms started.",
                "2. Help the person lie on their side with head slightly elevated.",
                "3. Keep them warm and calm."
            ],
            dontSteps: [
                "Do not give food or drink.",
                "Do not give Aspirin.",
                "Do not delay calling emergency services."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Choking",
            icon: "lungs.fill",
            doSteps: [
                "1. Give 5 firm back blows between the shoulder blades.",
                "2. Perform 5 abdominal thrusts.",
                "3. Repeat until object is removed or person becomes unconscious.",
                "4. If unconscious, start CPR."
            ],
            dontSteps: [
                "Do not perform a blind finger sweep.",
                "Do not give food or water until airway is clear."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Snake Bite",
            icon: "cross.case.fill",
            doSteps: [
                "1. Move away from the snake immediately.",
                "2. Keep the person calm and still.",
                "3. Keep the bitten limb below heart level.",
                "4. Remove jewelry or tight clothing.",
                "5. Apply a clean, dry dressing."
            ],
            dontSteps: [
                "Do not use a tourniquet.",
                "Do not cut the wound or suck venom.",
                "Do not apply ice or immerse in water."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Severe Allergic Reaction",
            icon: "allergens",
            doSteps: [
                "1. Call emergency services immediately.",
                "2. Help them use an Epinephrine Auto-Injector if available.",
                "3. Lay them flat with feet elevated unless breathing is difficult."
            ],
            dontSteps: [
                "Do not give oral medication if breathing is difficult.",
                "Do not wait for symptoms to improve."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Heat Stroke",
            icon: "sun.max.fill",
            doSteps: [
                "1. Move the person to a cool shaded area.",
                "2. Call emergency services immediately.",
                "3. Cool the body using ice packs, water spray, or fanning."
            ],
            dontSteps: [
                "Do not give fever-reducing medication.",
                "Do not give fluids if unconscious or confused."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Fracture",
            icon: "bandage.fill",
            doSteps: [
                "1. Stop bleeding with firm pressure.",
                "2. Immobilize using a splint.",
                "3. Apply ice wrapped in cloth to reduce swelling."
            ],
            dontSteps: [
                "Do not realign exposed bones.",
                "Do not move if neck or back injury is suspected."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Burns",
            icon: "flame.fill",
            doSteps: [
                "1. For thermal burns, run cool water for 10 to 20 minutes.",
                "2. For chemical burns, flush with water for at least 20 minutes.",
                "3. For electrical burns, turn off power source first.",
                "4. Cover loosely with a sterile non-stick bandage."
            ],
            dontSteps: [
                "Do not use ice, butter, or ointments.",
                "Do not pop blisters.",
                "Do not remove stuck clothing."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Severe Bleeding",
            icon: "drop.fill",
            doSteps: [
                "1. Apply firm direct pressure with clean cloth or gauze.",
                "2. Add more gauze if blood soaks through.",
                "3. Use a tourniquet if trained and bleeding does not stop."
            ],
            dontSteps: [
                "Do not remove embedded objects.",
                "Do not lift cloth to check frequently."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Asthma Attack",
            icon: "wind",
            doSteps: [
                "1. Help the person sit upright.",
                "2. Assist with rescue inhaler.",
                "3. Call emergency services if no improvement."
            ],
            dontSteps: [
                "Do not have them lie down."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Drowning",
            icon: "water.waves",
            doSteps: [
                "1. Remove the person safely from water.",
                "2. Check for breathing.",
                "3. Give 5 rescue breaths if not breathing.",
                "4. Begin CPR if no response."
            ],
            dontSteps: [
                "Do not risk your own life.",
                "Do not attempt to drain water from lungs."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "CPR (Adult)",
            icon: "cross.fill",
            doSteps: [
                "1. Ensure scene is safe and check responsiveness.",
                "2. Call emergency services and get an AED if available.",
                "3. Perform chest compressions at 100 to 120 per minute.",
                "4. Give 2 rescue breaths after every 30 compressions if trained."
            ],
            dontSteps: [
                "Do not stop compressions for more than 10 seconds.",
                "Do not perform CPR on someone breathing normally."
            ],
            benefits: nil,
            voiceEnabled: true
        )
    ]
    
    // MARK: - 4. NATURAL DISASTER
    static let disaster: [Instruction] = [
        Instruction(
            name: "Flood",
            icon: "water.waves",
            doSteps: [
                "1. Move to the highest level of the building immediately.",
                "2. Switch off the main electricity supply and gas valves.",
                "3. Listen to local radio or official emergency apps for evacuation orders.",
                "4. Boil drinking water or use bottled water only.",
                "5. Keep an emergency go-bag ready with documents, medicines, and flashlight."
            ],
            dontSteps: [
                "Do not walk or drive through moving water.",
                "Do not touch electrical equipment if wet or standing in water."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Earthquake",
            icon: "globe.asia.australia.fill",
            doSteps: [
                "1. Drop, Cover, and Hold On under sturdy furniture.",
                "2. Protect your head and neck.",
                "3. If outdoors, move away from buildings and utility wires.",
                "4. If inside a vehicle, stop in a clear area and remain inside.",
                "5. Stay away from glass windows and heavy furniture."
            ],
            dontSteps: [
                "Do not use elevators.",
                "Do not stand in a doorway.",
                "Do not run outside while shaking continues."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Cyclone or Storm",
            icon: "tornado",
            doSteps: [
                "1. Bring loose outdoor objects inside.",
                "2. Stay in a small windowless interior room or basement.",
                "3. Reinforce doors and stay away from glass windows.",
                "4. Charge all mobile devices and power banks.",
                "5. Store non-perishable food and water for several days."
            ],
            dontSteps: [
                "Do not go outside during the eye of the storm.",
                "Do not park vehicles under trees or power lines."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Lightning Strike",
            icon: "bolt.fill",
            doSteps: [
                "1. Seek shelter inside a substantial building or hard-topped vehicle.",
                "2. If in open field, crouch low to the ground.",
                "3. Unplug sensitive electronics before the storm.",
                "4. Stay away from corded phones, plumbing, and windows."
            ],
            dontSteps: [
                "Do not shelter under isolated tall trees.",
                "Do not stand near water bodies or metal fences."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Landslide",
            icon: "mountain.2.fill",
            doSteps: [
                "1. Listen for unusual sounds like cracking trees or rolling rocks.",
                "2. Move to the second floor of a building if possible.",
                "3. If escape is impossible, curl into a tight ball and protect your head.",
                "4. Stay alert during and after heavy rainfall.",
                "5. Watch for new structural cracks in buildings."
            ],
            dontSteps: [
                "Do not stay in the path of debris flow.",
                "Do not cross bridges if muddy water or debris is flowing underneath."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Tsunami",
            icon: "waveform.path.ecg",
            doSteps: [
                "1. Move inland and uphill immediately if near the coast after a strong earthquake.",
                "2. Do not wait for official warning.",
                "3. Aim for higher ground at least 100 feet above sea level.",
                "4. Stay away from the coast until officials declare it safe."
            ],
            dontSteps: [
                "Do not go to the beach to watch waves.",
                "Do not return after the first wave."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Forest Fire",
            icon: "flame.fill",
            doSteps: [
                "1. Evacuate immediately when instructed.",
                "2. Close all windows and doors.",
                "3. Turn on exterior lights for visibility in smoke.",
                "4. Wear an N95 mask to protect from smoke.",
                "5. Keep your vehicle fuel tank full during fire season."
            ],
            dontSteps: [
                "Do not wait until fire is visible before leaving.",
                "Do not attempt to fight a large fire yourself."
            ],
            benefits: nil,
            voiceEnabled: true
        )
        
    ]
    
    // MARK: - 5. ACCIDENTS
    static let accidents: [Instruction] = [
        Instruction(
            name: "Road or Vehicle Accident",
            icon: "car.fill",
            doSteps: [
                "1. Park safely at a distance and turn on hazard lights.",
                "2. Call emergency services and provide exact location and number of victims.",
                "3. Check for hazards like fire, leaking fuel, or downed power lines before approaching.",
                "4. Check if the victim is responsive and breathing.",
                "5. Apply firm direct pressure to stop visible bleeding using a clean cloth.",
                "6. If you are the driver and the vehicle is operable, move it to a safe shoulder area.",
                "7. Turn off the engine and set the parking brake.",
                "8. Check yourself and passengers for injuries."
            ],
            dontSteps: [
                "Do not move the victim unless there is immediate danger like fire.",
                "Do not remove a motorcyclist helmet unless they are not breathing and CPR is required.",
                "Do not ignore potential spinal injuries."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Fire Accident",
            icon: "flame.fill",
            doSteps: [
                "1. Crawl low under smoke where the air is cleaner.",
                "2. Test doors with the back of your hand before opening.",
                "3. Shout Fire and alert everyone immediately.",
                "4. Exit the building as quickly and safely as possible.",
                "5. If clothes catch fire, Stop, Drop, and Roll until flames are out.",
                "6. If outdoors, move upwind toward low vegetation or rocky areas."
            ],
            dontSteps: [
                "Do not use elevators.",
                "Do not go back inside for pets or valuables.",
                "Do not open windows if fire is outside.",
                "Do not run if your clothes catch fire."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Slip and Fall",
            icon: "figure.walk",
            doSteps: [
                "1. Stay still briefly and assess for pain.",
                "2. Slowly roll onto your side before attempting to stand.",
                "3. Use sturdy furniture for support when standing.",
                "4. If severe injury suspected, call emergency services.",
                "5. Keep head and neck still in case of spinal injury.",
                "6. If vomiting and unconscious, perform a careful log roll."
            ],
            dontSteps: [
                "Do not rush to get up.",
                "Do not move the head or neck if back injury is suspected."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Electric Shock",
            icon: "bolt.fill",
            doSteps: [
                "1. Turn off the main power supply immediately.",
                "2. If unable to turn off power, use a dry non-conductive object to separate victim.",
                "3. Check breathing and pulse.",
                "4. Start CPR if necessary.",
                "5. For high voltage lines, stay at least 20 feet away and call emergency services."
            ],
            dontSteps: [
                "Do not touch the victim if they are still in contact with electricity.",
                "Do not use wet or metal objects to move the victim.",
                "Do not approach high voltage power lines."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Machinery Accident",
            icon: "gearshape.fill",
            doSteps: [
                "1. Immediately press the emergency stop button or cut power.",
                "2. Stabilize the injured limb without forcing removal.",
                "3. Apply firm pressure above heavy bleeding sites.",
                "4. For amputation, wrap the severed part in clean damp cloth.",
                "5. Place wrapped part in waterproof bag and then into ice water container."
            ],
            dontSteps: [
                "Do not pull trapped limb out forcefully.",
                "Do not place severed part directly on ice.",
                "Do not use dry ice."
            ],
            benefits: nil,
            voiceEnabled: true
        )
        
    ]
    
    // MARK: - 6. CRIME
    static let crime: [Instruction] = [
        Instruction(
            name: "SOS Emergency",
            icon: "sos.circle.fill",
            phoneNumber: "911",
            doSteps: [
                "1. Tap the Call button below to dial emergency services immediately.",
                "2. Stay calm and clearly state your exact location.",
                "3. Describe the nature of your emergency.",
                "4. Follow any instructions given by the dispatcher."
            ],
            dontSteps: [
                "Do not hang up until the dispatcher tells you to.",
                "Do not panic; speak as clearly as possible."
            ],
            benefits: ["Instantly connects you with local emergency responders."],
            voiceEnabled: true
        ),
        Instruction(
            name: "Theft or Robbery",
            icon: "lock.open.fill",
            phoneNumber: "911",
            doSteps: [
                "1. Hand over requested items and prioritize your life.",
                "2. Stay calm and avoid sudden movements.",
                "3. Keep your hands visible.",
                "4. Observe appearance and direction of escape.",
                "5. Move to a safe populated area.",
                "6. Call the police immediately.",
                "7. Freeze bank cards and report stolen phone.",
                "8. Preserve the crime scene if possible."
            ],
            dontSteps: [
                "Do not fight back if the robber is armed.",
                "Do not chase the perpetrator."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Physical Assault",
            icon: "hand.raised.fill",
            phoneNumber: "911",
            doSteps: [
                "1. Shout loudly to attract attention.",
                "2. Create space and defend yourself only to escape.",
                "3. Run toward a crowded safe area.",
                "4. Seek medical attention immediately.",
                "5. Report the incident to police.",
                "6. Document injuries with photos."
            ],
            dontSteps: [
                "Do not allow yourself to be moved to a secondary location.",
                "Do not ignore medical evaluation."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Cyber Crime",
            icon: "desktopcomputer",
            doSteps: [
                "1. Disconnect device from the internet immediately.",
                "2. Use a separate device to change important passwords.",
                "3. Enable multi-factor authentication.",
                "4. Report the incident to the national cybercrime portal."
            ],
            dontSteps: [
                "Do not pay ransom demands.",
                "Do not click suspicious links or attachments."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Suspicious Activity",
            icon: "eye.fill",
            doSteps: [
                "1. Move to a safe and populated area.",
                "2. Make brief eye contact if safe.",
                "3. Note description and report to authorities.",
                "4. For suspicious packages, keep at least 100 meters distance.",
                "5. Inform security or police immediately."
            ],
            dontSteps: [
                "Do not touch unattended packages.",
                "Do not use phone near suspected explosive device."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Domestic Violence",
            icon: "house.fill",
            doSteps: [
                "1. Identify safe areas with exits.",
                "2. Establish a code word with trusted person.",
                "3. Keep an emergency go-bag ready.",
                "4. Contact domestic violence hotline.",
                "5. Apply for protection order if necessary."
            ],
            dontSteps: [
                "Do not delete threatening messages.",
                "Do not assume violence will stop without help."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Pickpocketing",
            icon: "bag.fill",
            doSteps: [
                "1. Keep valuables in front pockets.",
                "2. Wear backpacks in front in crowded areas.",
                "3. Stay alert for distraction techniques."
            ],
            dontSteps: [
                "Do not hang bags on chair backs.",
                "Do not keep all cash in one place."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "ATM Skimming",
            icon: "creditcard.fill",
            doSteps: [
                "1. Wiggle the card reader before inserting card.",
                "2. Cover keypad while entering PIN.",
                "3. Monitor bank statements immediately."
            ],
            dontSteps: [
                "Do not use tampered-looking machines.",
                "Do not accept help from strangers."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Public WiFi Security",
            icon: "wifi",
            doSteps: [
                "1. Use a VPN on public networks.",
                "2. Disable auto-connect to public WiFi.",
                "3. Use mobile data for sensitive transactions."
            ],
            dontSteps: [
                "Do not log into banking on unsecured WiFi.",
                "Do not install unknown certificates."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Road Rage",
            icon: "car.circle.fill",
            doSteps: [
                "1. De-escalate and allow aggressive drivers to pass.",
                "2. Keep doors locked and windows closed.",
                "3. Drive to a police station if followed."
            ],
            dontSteps: [
                "Do not use aggressive gestures.",
                "Do not exit vehicle to confront."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Unsafe Touch Awareness",
            icon: "shield.lefthalf.fill",
            doSteps: [
                "1. Say No loudly and firmly.",
                "2. Move away immediately.",
                "3. Go to a safe zone.",
                "4. Tell a trusted adult.",
                "5. Keep telling until someone helps.",
                "6. Document details if possible."
            ],
            dontSteps: [
                "Do not keep it a secret.",
                "Do not blame yourself.",
                "Do not ignore your instincts."
            ],
            benefits: nil,
            voiceEnabled: true
        )
        
        
        
    ]
    
    // MARK: - 7. HOME
    static let home: [Instruction] = [
        Instruction(
            name: "Gas Leak",
            icon: "exclamationmark.triangle.fill",
            doSteps: [
                "1. Open all windows and doors immediately.",
                "2. Close the regulator or main gas valve.",
                "3. Evacuate the area immediately.",
                "4. Inform fire services from a safe distance."
            ],
            dontSteps: [
                "Do not switch electrical appliances on or off.",
                "Do not use lighters or matches.",
                "Do not use your phone near the leak."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Short Circuit",
            icon: "bolt.fill",
            doSteps: [
                "1. Go to the main breaker panel immediately.",
                "2. Switch off the main power supply.",
                "3. Use a Class C fire extinguisher if fire starts."
            ],
            dontSteps: [
                "Do not throw water on electrical fire.",
                "Do not touch exposed wires."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Water Pipe Burst",
            icon: "drop.fill",
            doSteps: [
                "1. Locate and shut off the main water valve.",
                "2. Turn off electricity if water is near outlets.",
                "3. Move valuables away from flooding area."
            ],
            dontSteps: [
                "Do not ignore water near electrical sockets."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Vehicle Breakdown",
            icon: "car.fill",
            doSteps: [
                "1. Move vehicle to the shoulder safely.",
                "2. Turn on hazard lights immediately.",
                "3. Stay inside vehicle if on busy highway.",
                "4. If overheating, wait before opening radiator cap."
            ],
            dontSteps: [
                "Do not stop in high-speed lane.",
                "Do not open radiator cap immediately."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Locked Out",
            icon: "key.fill",
            doSteps: [
                "1. Contact a trusted locksmith.",
                "2. Show digital ID to prove ownership.",
                "3. Keep spare key with trusted neighbor."
            ],
            dontSteps: [
                "Do not attempt to break doors or windows."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Phone in Water",
            icon: "iphone",
            doSteps: [
                "1. Retrieve phone immediately.",
                "2. Turn it off immediately.",
                "3. Remove SIM and accessories.",
                "4. Dry exterior with lint-free cloth.",
                "5. Place in dry, ventilated area for 24 to 48 hours."
            ],
            dontSteps: [
                "Do not use rice.",
                "Do not use hairdryer.",
                "Do not charge until fully dry."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Kitchen Grease Fire",
            icon: "flame.fill",
            doSteps: [
                "1. Turn off the heat if safe.",
                "2. Cover pan with metal lid or baking sheet.",
                "3. Leave covered until fully cooled."
            ],
            dontSteps: [
                "Never throw water on grease fire.",
                "Do not move the pan."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Fuel Spill on Skin",
            icon: "fuelpump.fill",
            doSteps: [
                "1. Remove fuel-soaked clothing immediately.",
                "2. Wash skin with lukewarm water and soap for 15 minutes.",
                "3. Move to fresh air if fumes inhaled."
            ],
            dontSteps: [
                "Do not light cigarettes near spill.",
                "Do not put fuel-soaked clothes in dryer."
            ],
            benefits: nil,
            voiceEnabled: true
        )
        
    ]
    
    // MARK: - 8. TOURISM
    static let survival: [Instruction] = [
        Instruction(
            name: "Strategic Camp Building",
            icon: "tent.fill",
            doSteps: [
                "1. Choose a campsite protected from strong wind using natural windbreaks.",
                "2. Stay at least 200 feet away from water sources.",
                "3. Avoid tall grass, rocky crevices, and areas with visible wildlife activity.",
                "4. Look upward and avoid camping under dead or leaning trees.",
                "5. Use a ground tarp tucked fully under the tent floor.",
                "6. If using a tarp shelter, secure a tight ridgeline between trees.",
                "7. Angle the tarp downward on the wind-facing side for rain protection."
            ],
            dontSteps: [
                "Do not camp in narrow valleys that act as wind tunnels.",
                "Do not set up camp directly near rivers or lakes.",
                "Do not camp under unstable trees or loose branches."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Camp Food and Storage",
            icon: "fork.knife",
            doSteps: [
                "1. Set up cooking area at least 100 yards downwind from your tent.",
                "2. Store food 100 yards away from both tent and cooking area in a separate direction.",
                "3. Use a bear-proof canister when available.",
                "4. If no canister, hang food bag 12 feet high and 6 feet away from tree trunk.",
                "5. Use glowing coals instead of open flames for foil-pack cooking.",
                "6. Choose high-energy, low-fuel meals like couscous and trail-style wraps."
            ],
            dontSteps: [
                "Do not cook near your sleeping area.",
                "Do not leave food scraps around camp.",
                "Do not hang food too low or close to the tree trunk.",
                "Do not place foil meals directly in high flames."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Navigation Without Technology",
            icon: "location.north.fill",
            doSteps: [
                "1. Locate the Big Dipper constellation in the Northern Hemisphere.",
                "2. Follow the two outer stars of the cup upward to find Polaris, the North Star.",
                "3. In the Southern Hemisphere, locate the Southern Cross and extend its long axis to estimate the South direction.",
                "4. For daytime navigation, place a straight stick vertically into the ground.",
                "5. Mark the tip of the shadow with a stone.",
                "6. Wait about 20 minutes and mark the new shadow tip.",
                "7. Draw a line between the two marks - this forms the East-West axis.",
                "8. The first shadow mark indicates West; the opposite direction is East."
            ],
            dontSteps: [
                "Do not rely on moss growth on trees as a direction indicator.",
                "Do not assume the sun rises exactly due East or sets exactly due West except during equinox.",
                "Do not move while performing the shadow method, or the axis will be inaccurate."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Elephant Encounter",
            icon: "pawprint.fill",
            doSteps: [
                "1. Run in a zig-zag pattern to reduce their turning efficiency.",
                "2. Put large obstacles like trees or rocks between you and the elephant.",
                "3. Stay downwind if possible."
            ],
            dontSteps: [
                "Do not run in a straight line.",
                "Do not approach for photos.",
                "Do not scream or wave arms wildly."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Snake Encounter",
            icon: "exclamationmark.triangle.fill",
            doSteps: [
                "1. Stop immediately and stay still.",
                "2. Slowly back away without sudden movements.",
                "3. If bitten, keep the limb immobilized and below heart level.",
                "4. Seek medical help immediately."
            ],
            dontSteps: [
                "Do not attempt to suck out venom.",
                "Do not cut the wound.",
                "Do not apply ice or a tourniquet.",
                "Do not try to catch the snake."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Big Cat Encounter",
            icon: "eye.fill",
            doSteps: [
                "1. Maintain eye contact.",
                "2. Stand tall and make yourself appear larger.",
                "3. Speak loudly and firmly.",
                "4. Back away slowly."
            ],
            dontSteps: [
                "Do not run.",
                "Do not crouch.",
                "Do not turn your back."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Wild Dog Encounter",
            icon: "pawprint.fill",
            doSteps: [
                "1. Stay in a group if possible.",
                "2. Use sticks or fire to appear larger.",
                "3. Maintain strong posture."
            ],
            dontSteps: [
                "Do not run.",
                "Do not isolate yourself from the group.",
                "Do not show fear through sudden movements."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Black Bear Encounter",
            icon: "pawprint.fill",
            doSteps: [
                "1. Stand your ground.",
                "2. Make yourself appear larger.",
                "3. Fight back if attacked."
            ],
            dontSteps: [
                "Do not play dead.",
                "Do not run.",
                "Do not climb trees."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Bee Swarm Attack",
            icon: "ant.fill",
            doSteps: [
                "1. Run immediately in a straight line.",
                "2. Cover your face with clothing or arms.",
                "3. Seek enclosed shelter.",
                "4. Remove stingers by scraping once safe."
            ],
            dontSteps: [
                "Do not swat at bees.",
                "Do not stop running.",
                "Do not jump into water."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Uphill and Downhill Hiking Technique",
            icon: "figure.hiking",
            doSteps: [
                "1. On steep climbs, use the Rest Step by briefly locking your trailing leg.",
                "2. Shift weight onto your bones instead of continuously straining muscles.",
                "3. Take slow, rhythmic steps when ascending.",
                "4. While descending, keep your knees slightly bent.",
                "5. Keep your center of gravity directly over your feet.",
                "6. Take short, controlled steps instead of long strides."
            ],
            dontSteps: [
                "Do not rush uphill climbs.",
                "Do not lean backward while descending.",
                "Do not lock both knees while moving downhill.",
                "Do not take large bounding steps downhill."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Hypothermia",
            icon: "thermometer.snowflake",
            doSteps: [
                "1. Move the person out of wind, rain, or snow immediately.",
                "2. Remove all wet clothing and replace with dry layers and blankets.",
                "3. Apply warm compresses to the groin, armpits, and neck only.",
                "4. Give warm, sweet liquids if the person is conscious and able to swallow.",
                "5. Use shared body heat inside a sleeping bag if necessary."
            ],
            dontSteps: [
                "Do not apply direct high heat.",
                "Do not rub the body aggressively.",
                "Do not give alcohol.",
                "Do not force liquids if unconscious."
            ],
            benefits: nil,
            voiceEnabled: true
        ),
        Instruction(
            name: "Frostbite",
            icon: "hand.raised.fill",
            doSteps: [
                "1. Move to a warm shelter immediately.",
                "2. Protect the affected area with dry sterile dressings.",
                "3. Place gauze between fingers or toes if affected.",
                "4. Use passive rewarming with body heat.",
                "5. If no risk of refreezing, submerge in lukewarm water between 37 to 40 degrees Celsius for 20 to 30 minutes."
            ],
            dontSteps: [
                "Do not rub frostbitten skin.",
                "Do not use fire, heating pads, or boiling water.",
                "Do not give alcohol.",
                "Do not rewarm if there is risk of refreezing."
            ],
            benefits: nil,
            voiceEnabled: true
        )
        
    ]
    
    // MARK: - 9. DEFENCE
    static let defence: [Instruction] = [
        Instruction(name: "Basic Blocking", icon: "hand.raised.fill",
                    doSteps: ["Use your forearms to shield your face.", "Keep your chin tucked.", "Maintain a wide, stable stance."],
                    dontSteps: ["Do not close your eyes.", "Do not turn your back to the attacker."],
                    benefits: ["Physical protection"],
                    voiceEnabled: true),
        Instruction(name: "Wrist Grab Release", icon: "hand.raised.circle",
                    doSteps: ["Rotate your wrist toward the attacker's thumb.", "Pull away explosively.", "Shout 'FIRE' to get attention."],
                    dontSteps: ["Do not pull directly away from the fingers.", "Do not panic."],
                    benefits: ["Escape hold"],
                    voiceEnabled: true),
        Instruction(name: "Ground Defense", icon: "figure.walk.circle",
                    doSteps: ["Keep your feet between you and the attacker.", "Kick at knees or shins to create space.", "Stand up using the 'technical stand-up' method."],
                    dontSteps: ["Do not let them pin your arms.", "Do not lie flat on your back."],
                    benefits: ["Recovery"],
                    voiceEnabled: true),
        Instruction(name: "Stranger Attack", icon: "shield.checkered",
                    doSteps: ["Trust your gut; leave if uncomfortable.", "Carry a whistle or pepper spray if legal.", "Maintain situational awareness."],
                    dontSteps: ["Do not let a stranger lead you to a 'secondary location'.", "Do not be afraid of appearing rude."],
                    benefits: ["Prevention"],
                    voiceEnabled: true)
    ]
    
    // MARK: - 10. SIGNS
    static let signs: [Instruction] = [
        Instruction(name: "SOS Sign", icon: "signal.radiowaves.left.and.right",
                    doSteps: ["3 short, 3 long, 3 short signals (flashes or sounds).", "Write 'SOS' in large letters on the ground.", "Light 3 fires in a triangle."],
                    dontSteps: ["Do not stop signaling until help is confirmed.", "Do not use signals for fun."],
                    benefits: ["Universal distress"],
                    voiceEnabled: true),
        Instruction(
            name: "Ask for Angela",
            icon: "person.crop.circle.badge.exclamationmark",
            doSteps: [
                "1. Approach bar staff or venue staff quietly.",
                "2. Ask, 'Is Angela working tonight?' or 'Can I speak to Angela?'",
                "3. Follow staff instructions calmly.",
                "4. Allow staff to escort you to a safe exit or call transport."
            ],
            dontSteps: [
                "Do not confront the person making you uncomfortable.",
                "Do not announce the code loudly.",
                "Do not return to the unsafe situation after alerting staff."
            ],
            benefits: ["Provides a discreet way to signal distress and exit unsafe social situations safely."],
            voiceEnabled: true
        ),
        Instruction(
            name: "Covert Emergency Call",
            icon: "phone.fill.badge.exclamationmark",
            doSteps: [
                "1. Call emergency services.",
                "2. Pretend to order food and state your address clearly.",
                "3. Respond yes or no to dispatcher questions if possible.",
                "4. Stay on the line until help arrives."
            ],
            dontSteps: [
                "Do not hang up abruptly unless necessary.",
                "Do not argue with the dispatcher.",
                "Do not alert the attacker that police are being contacted."
            ],
            benefits: ["Allows silent communication with emergency services when speaking freely is dangerous."],
            voiceEnabled: true
        ),
        Instruction(
            name: "Mask-19 Signal",
            icon: "cross.case.fill",
            doSteps: [
                "1. Approach the pharmacy or clinic counter.",
                "2. Ask discreetly for 'Mask-19.'",
                "3. Follow staff to a private area.",
                "4. Cooperate with authorities when they arrive."
            ],
            dontSteps: [
                "Do not explain loudly in public.",
                "Do not return to the abuser after signaling for help."
            ],
            benefits: ["Provides a discreet signal for domestic violence victims to receive immediate protection."],
            voiceEnabled: true
        ),
        
        Instruction(name: "Hand Signals", icon: "hand.wave.fill",
                    doSteps: ["The 'Signal for Help': Thumb tucked in palm, fingers closed over it.", "Raise one arm and wave it slowly.", "Signal for 'Need Help' by placing one hand on head."],
                    dontSteps: ["Do not use casual waves if you are in distress."],
                    benefits: ["Silent help"],  voiceEnabled: true)
    ]
    
    // MARK: - ALL CATEGORIES ASSEMBLY
    static let allCategories: [EmergencyCategory] = [
        EmergencyCategory(name: "Yoga", icon: "figure.mind.and.body", color: .purple, emergencies: yoga),
        EmergencyCategory(name: "Exercise", icon: "figure.run", color: .blue, emergencies: exercise),
        EmergencyCategory(name: "Medical", icon: "cross.case.fill", color: .red, emergencies: medical),
        EmergencyCategory(name: "Natural Disaster", icon: "bolt.fill", color: .orange, emergencies: disaster),
        EmergencyCategory(name: "Accidents", icon: "car.fill", color: .pink, emergencies: accidents),
        EmergencyCategory(name: "Crime", icon: "shield.fill", color: .gray, emergencies: crime),
        EmergencyCategory(name: "Home", icon: "house.fill", color: .green, emergencies: home),
        EmergencyCategory(name: "Survival", icon: "map.fill", color: .brown, emergencies: survival),
        EmergencyCategory(name: "Defence", icon: "hand.raised.fill", color: .indigo, emergencies: defence),
        EmergencyCategory(name: "Sign", icon: "signal", color: .cyan, emergencies: signs)
    ]
}
