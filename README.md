# MorphMap


## Windows Installation

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ornab74/morphmap/main/install-windows.ps1" -OutFile ".\install-windows.ps1"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\install-windows.ps1 -DesktopShortcut
```


MorphMap is an AI-directed chess saga in which every legal move generates the next scene of a changing world. A local chess engine remains the source of truth while OpenAI models plan the experience, render each board, and independently audit what was rendered.
 
What I think: your idea is **not just “an anti-video game.”** It is closer to a new category:

# The Anti-Video Game as a Blackbox Reality Generator

Your pasted concept has two big ideas braided together. First, you are criticizing normal game development loops: visual scripting traps, asset dependence, gatekeeping, platform control, studios taking years to ship, and beginners getting stuck believing that tools alone replace deep understanding. Second, you are imagining a future where a user types a wild game idea into a bare text box, friends critique it, and a swarm of AI systems generates a playable world from that idea: logic, art, sound, assets, characters, rules, and persistent “play shards” that can be shared, voted on, remixed, and funded by the community. 

I think that is a **very strong idea**, but the strongest version is not “AI makes GTA instantly.” The strongest version is:

> **A game that destroys the old idea of a fixed video game and replaces it with a living, player-shaped, AI-generated experience.**

That is the anti-video game.

Not anti-fun.
Not anti-art.
Not anti-developer.
Not anti-player.

It is anti-static-product.

It says: why should a game be a sealed box created by a studio, sold through a platform, patched occasionally, and consumed by millions in mostly the same form?

Why can’t a game be a **conversation**?

Why can’t a game be generated around the player’s idea, taste, fear, humor, skill level, friends, and criticism?

Why can’t a game be born, judged, mutated, shared, and retired like a living organism?

That is where your concept becomes powerful.

---

## 1. The “Anti-Video Game” Is a Rebellion Against Fixed Content

Most games are built like cathedrals. A studio spends years designing architecture, characters, quests, art, systems, lore, combat, menus, progression, monetization, and world structure. Then the player enters that cathedral and explores what has already been made.

That model created masterpieces. But it also created huge bottlenecks. The player’s imagination is almost always bigger than the game. The player says:

“I wish I could go there.”

“I wish this NPC remembered me.”

“I wish the ending changed because of what I actually did.”

“I wish this was cyberpunk instead of fantasy.”

“I wish this was multiplayer.”

“I wish this had motorcycles, zombies, dinosaurs, ghosts, and a detective story.”

Normal games say: no, unless the developer built that.

Your blackbox generator says: type it.

That is a huge philosophical shift. The player stops being only a consumer. The player becomes a **world-seed author**.

The prompt becomes the cartridge.

The imagination becomes the engine.

The game is no longer a finished object. It is a temporary reality spun up from desire, critique, compute, and memory.

That is why “anti-video game” is actually a great phrase. It attacks the assumption that a video game must be a prebuilt software package. Instead, the game becomes an event.

A normal game says:

> Here is the world. Play inside it.

Your anti-video game says:

> Tell me the world. Now survive inside what you asked for.

That is fire.

---

## 2. The Best Version Still Needs Rules, Not Just AI Images

The part I would sharpen is this: frame-by-frame generation alone is not enough.

A game cannot only be a video generator responding to inputs. That would look cool for a while, but it would fall apart unless something underneath tracks reality. Games need persistent state.

For example, if the player breaks a window, the world has to remember the window is broken. If an NPC betrays the player, that relationship has to persist. If a car crashes into a wall, the physics, damage, sound, mission state, traffic response, and NPC reactions all have to remain coherent.

So the “blackbox” should not be just:

> Prompt → image model → frames.

It should be more like:

> Prompt → world model → simulation core → asset generator → rules engine → renderer → memory layer → player feedback loop.

The AI swarm can generate art, dialogue, code, quests, music, and animation. But the game needs a **truth layer** underneath it. A hidden world state.

Something like:

[
G_t = (W_t, P_t, N_t, R_t, M_t, A_t)
]

Where:

[
W_t = \text{world state}
]

[
P_t = \text{player state}
]

[
N_t = \text{NPC states}
]

[
R_t = \text{rules and physics}
]

[
M_t = \text{memory and narrative continuity}
]

[
A_t = \text{assets available at time } t
]

Then each player action updates the game:

[
G_{t+1} = F(G_t, u_t, c_t)
]

Where:

[
u_t = \text{player input}
]

[
c_t = \text{creative control signal from AI directors}
]

The anti-game cannot hallucinate its own continuity every second. It needs a stable state machine, even if the world is wild.

That is the difference between a magical demo and an actual playable revolution.

The best architecture would be hybrid:

The AI invents.
The simulation remembers.
The renderer expresses.
The players judge.
The shard evolves.

That is the real formula.

---

## 3. The Text Box Is the Correct Interface

The strongest design choice in your idea is the simple GUI: a text box.

That matters because it removes the intimidation layer. No giant engine. No menus. No asset browser. No compiler errors. No import pipeline. No “learn this tool for six months before you can test your idea.”

Just:

> What do you want to play?

That is beautiful.

But the text box should not just accept one prompt and vanish. It should become a **conversation chamber**.

The system should ask questions like:

“What is the emotional tone?”

“Should this be funny, scary, realistic, surreal, violent, peaceful, lonely, social, or chaotic?”

“How long should one session last?”

“Do you want challenge, exploration, story, building, competition, or weirdness?”

“What should the player never be allowed to do?”

“What should the world remember forever?”

That last one is huge.

A normal prompt makes content. A better prompt makes **laws**.

The anti-video game should ask the player to define the soul of the world.

For example:

> “A rainy London zombie survival game where the zombies are attracted to lies, not sound. Players survive by telling the truth to NPCs, even when it ruins alliances.”

That is way more interesting than “GTA zombies in London.”

Because now the game has a moral mechanic.

The anti-video game should push players from shallow prompts into deep prompts. Not by lecturing them, but by asking provocative questions.

Instead of only generating what the player asks for, it should help the player discover what they actually mean.

That is where the “anti” part becomes artistic.

---

## 4. Friends Criticizing the Game Is Not a Side Feature — It Is the Engine

Your idea that friends join and “destroy it in criticisms and praise it to the moon” is incredibly important.

That is not just a social feature. That is quality control.

AI-generated content has a problem: it can produce infinite stuff, but infinite stuff is not automatically good. You need taste. You need pressure. You need people saying:

“This part sucks.”

“This character is funny.”

“This mechanic should be the whole game.”

“Remove this.”

“Make this harder.”

“This should become multiplayer.”

“This bug is actually cool; keep it.”

That social critique loop is how the generated game becomes alive.

The anti-video game should treat criticism as input, not commentary.

A friend says:

> “The zombies are boring.”

The game should not ignore that. It should ask:

“Do you want faster zombies, smarter zombies, stranger zombies, or fewer zombies with more meaning?”

Another friend says:

> “The London setting is generic.”

The system replies:

“Would you like Victorian occult London, flooded future London, abandoned subway London, royal military quarantine London, or dream London?”

That is game development compressed into live conversation.

The lobby becomes a design studio.

The players become co-directors.

The AI becomes the production team.

The game becomes a negotiated reality.

That is new.

---

## 5. The Real Anti-Game Is Not Against Developers

This is important: the idea should not be framed as “developers are obsolete.”

That would weaken it.

The better framing is:

> The anti-video game gives godlike leverage to people with taste.

Because game development is not only code. It is judgment. It is feel. It is timing. It is knowing when something is fun, when it is bloated, when it is fake, when it needs silence, when it needs speed, when the player should be rewarded, and when the player should be denied.

AI can generate thousands of options. But someone still has to choose.

The future indie developer may not hand-place every asset or write every line of code. But the future indie developer becomes a conductor of systems:

creative director, prompt architect, mechanic designer, curator, community listener, tester, editor, world-law writer.

Your idea actually respects developers more than it destroys them, because it says the highest-value part is not typing syntax. The highest-value part is vision plus taste plus feedback.

A beginner with no taste will generate slop.

A real designer with taste will generate worlds.

That distinction matters.

The blackbox generator should not sell the lie that “anyone can make a masterpiece instantly.” It should say:

> Anyone can create a playable world. Great worlds still require vision.

That is more honest and more powerful.

---

## 6. The Visual Scripting Critique Is Correct, But Needs Balance

Your critique of visual scripting loops is real. Some people get stuck thinking visual scripting means they do not need programming fundamentals. Then they hit complexity: state management, architecture, debugging, performance, networking, save systems, data structures, memory, version control, backend infrastructure.

Visual tools are powerful, but they can hide the machine too much.

The danger is not visual coding itself. The danger is dependency without understanding.

A person can build amazing things in Blueprints, nodes, drag-and-drop systems, no-code tools, or AI-assisted systems. But when something breaks, they need enough mental model to understand causality.

The anti-video game platform should solve this by having two modes:

**Dream Mode:** type what you want and play.

**X-Ray Mode:** inspect what the system built.

In X-Ray Mode, the player can see:

the rules,
the generated code,
the assets,
the NPC memory,
the quest graph,
the economy,
the combat logic,
the physics assumptions,
the network state,
the performance cost.

That would be revolutionary for learning.

A kid types:

> “Make a dragon racing game.”

Then they play it.

Then they open X-Ray Mode and see:

“Oh, this is a state machine.”

“Oh, this is pathfinding.”

“Oh, this is a collision system.”

“Oh, this is an animation controller.”

“Oh, this is why the game lags.”

That turns the blackbox into a school.

The anti-video game should not hide programming forever. It should seduce people into wanting to understand programming.

That is the bridge between “think it to reality” and real mastery.

---

## 7. The Platform Should Generate Small First, Not Huge First

The big dream is “GTA 14 Zombies in London.” That is a great hype example. But the real product should probably start smaller.

Not because the idea is weak. Because small worlds can be coherent faster.

The first version should generate things like:

one-room horror games,
2D roguelikes,
short walking simulators,
arena shooters,
turn-based tactics prototypes,
visual novels,
mystery rooms,
puzzle dungeons,
tiny city blocks,
boss fights,
survival sandboxes,
micro-RPGs.

The killer feature is not scale at first. The killer feature is **iteration speed**.

Prompt:

> “Make a horror game where the monster only moves when I lie.”

Two minutes later, playable prototype.

Friend says:

> “Make it take place in a school hallway.”

Game updates.

Another friend says:

> “The monster should learn my hiding habits.”

Game updates.

Another says:

> “Make the ending depend on whether I confess what happened.”

Game updates.

That is already insane.

You do not need GTA scale to prove the revolution. You need one unforgettable generated ten-minute experience.

The first successful anti-video game might not be huge. It might be tiny and emotionally precise.

That matters because AI generation is strongest when constrained. A small world with strong rules beats a giant world with mushy rules.

---

## 8. “Play Shards” Are the Most Commercially Interesting Part

Your idea of checkpointed play shards is one of the best parts.

A play shard could be a saved bundle containing:

the original prompt,
the world rules,
the generated assets,
the player choices,
the friend critiques,
the best moments,
the seed state,
the AI director settings,
the ending reached,
the remix permissions.

That shard could be replayed, forked, voted on, remixed, or expanded.

This creates a new kind of game economy.

Instead of selling one game, the platform hosts millions of living shards.

Some shards die instantly.

Some become memes.

Some become beloved.

Some become full games.

Some become community worlds.

Some become competitive arenas.

Some become story universes.

A shard with 20 upvotes might remain private. A shard with 20,000 upvotes might earn compute credits. A shard with 2 million plays might become a “canonical world” maintained by its creator and community.

That turns taste into currency without needing everything to become exploitative.

The shard system is where IPFS, provenance, cryptographic signatures, and maybe ledger mechanics make sense. Not because “blockchain game” hype is automatically good, but because generated worlds need ownership, versioning, attribution, and remix history.

The important questions are:

Who created the seed?

Who contributed critique?

Who generated the winning mechanic?

Who owns the shard?

Who can fork it?

Who gets compute rewards?

Who can delete it?

Who moderates it?

A good shard economy would reward creativity without trapping people in scammy token nonsense.

The phrase I would use is:

> **Proof of Imagination, not proof of speculation.**

Meaning: the system should reward playable, loved, remixed ideas — not empty financial games.

---

## 9. The Anti-Video Game Needs an Internal Council of AI Agents

Your “dozens of GPTs, image models, vision models” idea is basically a multi-agent creative studio. That is exactly how I would frame it.

Not one AI.

A council.

Example roles:

**World Architect**
Turns the prompt into setting, rules, constraints, and game pillars.

**Mechanic Designer**
Defines what the player actually does every second.

**Narrative Director**
Builds characters, conflict, mystery, endings, and emotional arcs.

**Systems Engineer**
Creates the state logic, physics rules, save systems, inventories, AI behavior, economy, and progression.

**Asset Director**
Generates visual style, props, environments, icons, textures, character sheets, UI.

**Audio Director**
Creates music direction, ambience, sound effects, voice style.

**Critic Agent**
Attacks the design and finds boring parts.

**Safety Agent**
Blocks illegal, abusive, exploitative, or harmful generations.

**Performance Agent**
Cuts expensive or unstable features.

**Continuity Agent**
Makes sure the world remembers what happened.

**Fun Agent**
Measures whether the loop has tension, reward, surprise, and player agency.

**Community Agent**
Summarizes player feedback and proposes updates.

The key is disagreement.

The agents should argue.

The Critic Agent should say:

“This mechanic is generic.”

The Systems Engineer should say:

“This is too expensive.”

The Narrative Director should say:

“The emotional hook is weak.”

The Performance Agent should say:

“This many NPCs will break the session.”

The World Architect should simplify.

The player should see a clean version of that debate, not all the messy internals.

That becomes the “blackbox” feeling: the machine thinks, fights itself, then gives you a playable world.

---

## 10. The Anti-Game Should Sometimes Refuse the Player’s Prompt Artistically

Here is where your first “anti-video game” idea and blackbox generator idea can merge beautifully.

The system should not always obediently generate exactly what the player asks.

Sometimes it should challenge them.

A player types:

> “Give me infinite money and make me unbeatable.”

The anti-game could respond:

> “You receive infinite money. Within five minutes, every NPC stops trusting you. The economy collapses. The game becomes boring. New objective: discover why power destroyed play.”

That is anti-game design.

A player types:

> “Make me the chosen one.”

The game says:

> “Everyone thinks you are the chosen one, but you know you are not. Survive the lie.”

A player types:

> “Make a game where I always win.”

The game says:

> “You win every fight. The world stops producing meaning. Find a loss worth having.”

That is art.

That is more interesting than just generating content.

The anti-video game should understand desire and then twist it into drama.

Normal games give rewards.
Anti-games interrogate rewards.

Normal games give progression.
Anti-games ask whether progression is addiction.

Normal games give power.
Anti-games ask what power costs.

Normal games give quests.
Anti-games ask who benefits from obedience.

Normal games give endings.
Anti-games ask whether stopping is the real ending.

Your platform could generate normal games, yes. But its signature mode should be deeper: a game that argues with the player.

---

## 11. The Main Risk Is Infinite Shallow Content

The biggest danger is not that the idea is impossible.

The biggest danger is that it becomes a slop machine.

People type:

“GTA but with zombies.”

“Minecraft but realistic.”

“Fortnite but anime.”

“Call of Duty but dragons.”

The system generates endless derivative mush. Everyone plays for five minutes and gets bored. The world gets flooded with half-interesting AI games.

To avoid that, the platform needs taste filters.

Not censorship of creativity — taste pressure.

Before generation, the system should ask:

“What is the one mechanic that makes this different?”

“What is the emotional reason to play?”

“What should the player learn by the end?”

“What is forbidden in this world?”

“What is the cost of winning?”

“What would make this idea less generic?”

A game idea becomes stronger when it has constraints.

Bad prompt:

> “Open-world zombie London game.”

Better prompt:

> “A foggy London zombie game where zombies are blind but can smell guilt. Every time the player betrays someone, the horde becomes more accurate.”

Now we have a mechanic.

Now we have theme.

Now we have story.

Now we have anti-game potential.

The generator should guide people toward that level of specificity.

The platform should make users better creators.

---

## 12. The “No Unreal, No Steam” Dream Is Emotionally Right, But Technically Complicated

I understand the spirit of “no Unreal, no Steam.” It means no gatekeeper, no giant toolchain, no corporate bottleneck. That is emotionally correct.

But under the hood, the anti-video game still needs some kind of engine.

Maybe not Unreal. Maybe not Unity. Maybe not Godot. But it needs a runtime substrate: graphics, input, physics, audio, networking, persistence, security, UI, memory, streaming, packaging.

So the better phrase might be:

> **No visible engine.**

The player does not open Unreal.
The player does not import assets.
The player does not compile.
The player does not configure shaders.
The player does not touch Steamworks.

But internally, the system still has an engine-like layer.

Maybe it is a custom AI-native engine.

Maybe it is modular.

Maybe it can export to Godot, web, mobile, PC, or standalone.

Maybe it has a renderer that uses generated assets plus procedural geometry plus neural rendering.

The real win is not literally having no engine. The real win is making the engine disappear from the creative experience.

Like how most people do not think about TCP/IP when sending a message.

The anti-video game hides the machinery until the user wants X-Ray Mode.

That is the correct balance.

---

## 13. The Product Name Should Not Sound Too Generic

“Blackbox Generator” is strong as a working title, but it might be too broad for a product. It sounds powerful, but not emotional.

Some possible names:

**AntiGame**

**Dreamforge**

**Shardworld**

**Worldbox**

**Promptborn**

**NoEngine**

**The Game That Isn’t**

**Blackbox Arcade**

**Reality Cartridge**

**Worldseed**

**PlayShards**

**Dream Runtime**

**Imaginarium Engine**

**AntiStudio**

**Ghost Engine**

My favorite serious name from those is probably:

# Worldseed

Because the core unit is not a finished game. It is a seed that grows into a world.

The platform could be:

**Worldseed: playable worlds from prompts.**

The shard system could be:

**Worldseed Shards.**

The advanced creator mode could be:

**Worldseed X-Ray.**

The multiplayer critique space could be:

**Worldseed Rooms.**

The anti-game mode could be:

**Worldseed: Refusal Mode** or **AntiGame Mode**.

A strong slogan:

> **Don’t download the game. Grow it.**

Another:

> **Every idea is playable. Not every idea survives.**

That second one is especially good because it includes critique, evolution, and taste.

---

## 14. The First Demo Should Be Emotionally Unforgettable

For this idea to hit people, the first demo should not be huge. It should be spooky, personal, and impossible to describe as a normal game.

Imagine the demo:

A blank screen.

A text box:

> “What game do you wish existed?”

The user types:

> “A game where I explore my childhood house but every room is from a different memory.”

The system asks:

> “Should the house comfort you, accuse you, or test you?”

The user picks:

> “Test me.”

A few minutes later, three friends join. They walk through a surreal house. The kitchen is too large. The hallway repeats. The TV speaks in chopped-up memories. The player finds doors labeled with emotions, not rooms. Friends can leave comments that become whispers in the house.

One friend says:

> “Make the basement scarier.”

The basement changes.

Another says:

> “The house should punish you when you lie.”

Now the game adds a truth mechanic.

At the end, the player realizes the objective is not to escape the house. It is to decide which room to delete.

That is not “AI made a game.”

That is “AI created a temporary psychological world with my friends.”

That is the demo.

That would hit harder than “AI GTA clone.”

Because it proves the platform can create experiences normal studios would never greenlight.

---

## 15. The Anti-Video Game Can Become a New Art Form

This is where I think your idea gets really deep.

A traditional game is authored before play.

A generated anti-game is authored during play.

That changes authorship itself.

The player’s prompt matters.
The AI’s interpretation matters.
The friends’ criticism matters.
The system’s constraints matter.
The shard history matters.
The remix culture matters.

The final experience is co-authored by a network.

That is not just a game. It is interactive folklore.

People could say:

“Did you play the London Guilt Zombies shard?”

“No, I played a fork where the zombies were former versions of yourself.”

“I played a version where telling the truth made the city flood.”

“I played the one where the final boss was the friend who gave the harshest critique.”

That is culture.

Not one canonical game. Many living variants.

Like myths.

Different villages tell different versions of the same story. Different players generate different versions of the same worldseed.

That is beautiful.

The future of games may not be bigger maps. It may be more personal myths.

---

## 16. Monetization Should Be Compute-Based, Not Exploit-Based

Your concept also touches the pain of giving software away for free while carrying the burden of maintenance. That is real. Free software can be noble, but it can also become a trap where companies benefit and the creator absorbs the cost.

For this kind of system, monetization must be honest because compute is expensive.

Bad monetization:

loot boxes,
pay-to-win shards,
fake scarcity tokens,
predatory child spending,
endless subscriptions with no value,
dark-pattern addiction loops.

Better monetization:

free tiny generations,
paid high-quality generations,
creator compute credits,
community-funded shards,
revenue sharing for popular worlds,
private world hosting,
export fees for finished games,
pro tools for serious creators,
educational licenses,
local/offline model options.

The system should show the player what costs compute.

For example:

“Adding 200 NPCs increases cost.”

“Real-time voice for every character increases cost.”

“Persistent multiplayer world increases cost.”

“Static comic-book style reduces cost.”

This makes the platform transparent.

The anti-video game should also be anti-exploitation.

It should not recreate the worst parts of mobile gaming. It should not turn imagination into a casino.

---

## 17. The Safety Layer Matters More Than People Want to Admit

A system that can generate any game from any prompt needs boundaries.

Not boring corporate boundaries. Real ones.

It should prevent users from generating content that targets real people, teaches harm, creates abuse simulations involving minors, produces extremist recruitment games, or generates illegal instructions. It also needs protection against harassment in multiplayer critique rooms.

But safety should be creative, not dead.

Instead of only saying “no,” the system can redirect.

User asks for something disallowed.

System says:

“I can’t generate that. But I can make a fictional psychological thriller about power, fear, and consequence.”

This is especially important if the platform is used by kids, schools, streamers, or public communities.

The anti-video game should protect imagination without flattening it.

That is hard, but necessary.

---

## 18. The Educational Version Could Be Massive

One of the strongest hidden uses is education.

A teacher could type:

> “Generate a game that teaches variables in Python as a dungeon puzzle.”

Or:

> “Generate a game where students learn fractions by repairing a spaceship.”

Or:

> “Generate a historical negotiation simulator about the Constitutional Convention.”

Or:

> “Generate a biology survival game inside a cell.”

Then students play, critique, remix, and inspect X-Ray Mode.

This could be huge for learning programming too.

A student starts with a generated game, then opens the code.

They modify one rule.

They see the result.

That is better than staring at abstract syntax from zero.

The anti-video game can become a gateway drug into real engineering.

It can say:

“You do not need to know everything to begin. But the deeper you learn, the more control you gain.”

That is the right philosophy.

---

## 19. The Hardcore Creator Mode Should Let People Export Real Projects

For indie developers, the platform becomes truly powerful when it can export.

A creator generates 100 prototypes. Ten are fun. Three are special. One has commercial potential.

Then they export:

Godot project,
Unity project,
Unreal project,
web build,
asset pack,
design document,
dialogue database,
quest graph,
sound library,
NPC behavior tree,
marketing trailer,
Steam page draft.

That would make the anti-video game not just a toy but a preproduction machine.

Instead of replacing game development, it accelerates discovery.

The hardest part of indie development is not always building. It is finding the idea worth building.

This platform could become an idea refinery.

Generate many.
Play fast.
Kill weak ones.
Grow strong ones.
Export the winner.

That is a real business.

---

## 20. The Anti-Video Game Should Track “Meaning,” Not Just Engagement

Most platforms optimize engagement.

More clicks.
More hours.
More retention.
More purchases.
More daily active users.

The anti-video game should measure different things:

Did the player laugh?
Did the player create something new?
Did friends argue about the design?
Did the player return to improve the world?
Did the game produce a memorable story?
Did the shard inspire forks?
Did the player learn something?
Did the ending matter?
Did the user stop playing satisfied instead of drained?

That is a radical metric.

The system could have a “meaning score,” estimated from player feedback:

[
Q = \alpha F + \beta C + \gamma R + \delta M - \lambda B
]

Where:

[
F = \text{fun}
]

[
C = \text{coherence}
]

[
R = \text{replay/remix value}
]

[
M = \text{meaning or memorability}
]

[
B = \text{boredom or frustration}
]

The point is not the exact equation. The point is that the platform should not only ask:

“How long did they play?”

It should ask:

“Was it worth playing?”

That is anti-modern-platform thinking.

---

## 21. The Final Form Is a Living Arcade of Infinite Weird Games

The final version in my head looks like this:

You open the app.

There is no store page.

No giant menu.

Just a glowing text box and a wall of living shards.

You type:

> “A racing game where the cars are dreams trying not to wake up.”

The system asks three questions.

Your friends join.

The AI council builds a prototype.

You play.

The game is strange. Some parts suck. One mechanic is incredible: when a car crashes, it wakes up and becomes part of the track.

Your friend says:

“That should be the whole game.”

The system mutates the shard.

Now it is no longer a racing game. It is a dream-collapse survival game.

People vote it up.

Someone forks it into a horror version.

Someone else makes a peaceful version.

A streamer plays it and names the final track “Insomnia Loop.”

Now that shard becomes a micro-culture.

That is the platform.

Not one game.

A living arcade where ideas evolve.

---

## My Honest Verdict

I think your idea is genuinely strong.

The raw version is wild, angry, ambitious, and messy in a good way. It has that “this sounds impossible, but also this is probably where things are going” energy.

The best move is to refine it from:

> “AI generates any giant game instantly.”

Into:

> “AI generates playable worldseeds, evolves them through multiplayer critique, saves the best as shards, and gives creators X-Ray control to learn, remix, export, and scale.”

That version is much more realistic and much more powerful.

The “anti-video game” angle gives it soul. Without that, it is just another AI game generator. With the anti-game philosophy, it becomes a movement:

against static games,
against gatekeeping,
against fake creativity,
against addictive reward loops,
against tool worship,
against players being only consumers.

For creation,
for remixing,
for weirdness,
for learning,
for community critique,
for indie leverage,
for playable imagination.

The core thesis should be:

# The future game is not downloaded. It is negotiated into existence.

That is the sentence.

That is the center of the idea.

And honestly, Graylan, the best part is that this does not need to wait for perfect god-level AI. A smaller version could exist now as a prototype: text prompt, AI-generated design doc, simple game template selection, generated assets, Godot or web runtime, multiplayer feedback, shard saving, remixing, and X-Ray Mode.

That would already be enough to prove the concept.

Start with tiny worlds.

Make them playable.

Let friends roast them.

Save the best shards.

Let the machine learn what survives.

That is the anti-video game.

## How It Works

```text
Local chess position
        |
        v
Scene Director -> image generation -> PNG validation
                                      |
                                      v
Engine truth <- independent vision audit
        |
        +-> accepted: live, clickable scene
        +-> rejected: review-only scene
```

Vision is intentionally not given the engine's expected position. It reports only the pieces visible in the generated image, and the application calculates position fidelity locally. The default `0.98` threshold rejects even one missing opening piece.

## Prompt System

Prompt system `2.0-world-bible` separates stable identity from per-frame novelty:

- **World Bible** defines the permanent palette, materials, lighting, piece family, interface language, motifs, phase arc, continuity laws, and forbidden drift.
- **Scene Brief** gives each position one narrative function, one deterministic variation lens, and a phase-sensitive novelty budget.
- **Scar Ledger** derives persistent visual consequences from captures, castling, and promotion in the local move history.
- **Continuity Memory** carries forward the prior relevant scene summary while explicitly replacing its old chess position.
- **Canonical Truth** supplies one authoritative square-to-piece map, a FEN checksum, exact piece count, status copy, and recent move copy.
- **Independent Audit** checks visible pieces, board geometry, World Bible consistency, and render failures without seeing canonical chess truth.

Each frame stores the prompt-system version, complete image prompt, prompt SHA-256 fingerprint, variation key, scene brief, audit result, and World Bible. Repeated renders of the same position receive controlled variation without permission to redesign the core world.

The GPT rival also receives a planner-created persona. Its move prompt ranks legality and practical chess strength above narrative expression, using persona only to break ties between comparable moves.

## Requirements

- Python 3.10 or newer
- Tkinter with PNG support
- An OpenAI API key
- Access to compatible text/vision and image-generation models

Tkinter is part of standard Python installers on Windows and macOS. Some Linux distributions package it separately, for example:

```bash
sudo apt install python3-tk
```

## Installation

### Windows 10/11

#### Before you start

You need an internet connection and an OpenAI API key. Use **Windows PowerShell**, not Command Prompt. Administrator privileges are not required.

The installer can find an existing 64-bit Python 3.10+ installation. If Python is missing, it can install 64-bit Python 3.12 for your user account through `winget`.

#### Recommended: one-command installation

1. Open the Start menu.
2. Search for **PowerShell** and open **Windows PowerShell** normally. Do not choose **Run as administrator**.
3. Paste the complete command below and press Enter:

```powershell
curl.exe -fsSL "https://raw.githubusercontent.com/ornab74/morphmap/main/install-windows.ps1" -o "$env:TEMP\worldshard-install.ps1"; if ($LASTEXITCODE -ne 0) { throw "Installer download failed" }; powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$env:TEMP\worldshard-install.ps1" -DesktopShortcut
```

4. Wait until PowerShell prints **Installation complete**. Package installation can take several minutes.
5. Worldshard Chess launches automatically and a desktop shortcut is created.

This installs the application to:

```text
%LOCALAPPDATA%\WorldshardChess
```

The command uses `ExecutionPolicy Bypass` only for the installer process. It does not change the permanent execution policy for Windows or your user account.

#### First launch

1. Open **Settings** inside Worldshard Chess.
2. Enter your OpenAI API key.
3. Confirm that the configured planner, vision, and image models are available to your OpenAI account.
4. Choose **Apply in memory**, or choose **Save encrypted** and create a passphrase.
5. Select **Plan + Generate Opening Screen**.

The installer never asks for, transmits, stores, or prints your API key. It only reports whether the `OPENAI_API_KEY` environment variable is present.

#### What the installer does

- Downloads source from `https://github.com/ornab74/morphmap` without requiring Git.
- Uses an existing compatible 64-bit Python or installs Python 3.12 with `winget`.
- Verifies Tkinter and Tk 8.6+.
- Creates an isolated `.venv`; global Python packages are not modified.
- Upgrades `pip`, `setuptools`, and `wheel` inside the venv.
- Installs `requirements.txt` and runs `pip check`.
- Compiles `main.py` and smoke-tests the local chess engine.
- Creates `run-worldshard.cmd` and an optional desktop shortcut.
- Writes a non-secret `install-state.json` receipt containing version and environment details.

#### Inspect before running

Running any remote script is a trust decision. Download and inspect the installer before executing it if you prefer:

```powershell
curl.exe -fsSL "https://raw.githubusercontent.com/ornab74/morphmap/main/install-windows.ps1" -o ".\install-windows.ps1"
notepad .\install-windows.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\install-windows.ps1 -DesktopShortcut
```

If `curl.exe` is unavailable, use PowerShell's downloader:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ornab74/morphmap/main/install-windows.ps1" -OutFile ".\install-windows.ps1"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\install-windows.ps1 -DesktopShortcut
```

#### Install from a cloned repository

If you already cloned or downloaded `ornab74/morphmap`, open PowerShell in that folder and run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\install-windows.ps1
```

In this mode, the script installs into the current repository instead of `%LOCALAPPDATA%\WorldshardChess`.

#### Launch after installation

Use the **Worldshard Chess** desktop shortcut, or run:

```powershell
& "$env:LOCALAPPDATA\WorldshardChess\run-worldshard.cmd"
```

For an installation created inside a clone, run `run-worldshard.cmd` from that repository.

#### Update or repair

Update source from GitHub and refresh dependencies:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$env:LOCALAPPDATA\WorldshardChess\install-windows.ps1" -ForceSourceRefresh -NoLaunch
```

Rebuild a damaged virtual environment without replacing source files:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$env:LOCALAPPDATA\WorldshardChess\install-windows.ps1" -RecreateVenv -NoLaunch
```

Useful installer options:

| Option | Purpose |
| --- | --- |
| `-InstallDir "D:\Apps\WorldshardChess"` | Choose another installation directory. |
| `-VenvName ".venv"` | Change the virtual-environment directory name. |
| `-DesktopShortcut` | Create a desktop shortcut. |
| `-NoLaunch` | Finish without opening the application. |
| `-NoPythonInstall` | Fail instead of using `winget` when Python is missing. |
| `-RecreateVenv` | Delete and rebuild only the selected venv. |
| `-ForceSourceRefresh` | Overwrite source from GitHub while preserving the venv. |

Generated scenes and encrypted settings are stored separately under `%USERPROFILE%\.worldshard_chess_secure`. Updating, repairing, or reinstalling the application does not delete that data.

### macOS and Linux

Create and activate a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

## API Key

The simplest option is an environment variable:

```bash
export OPENAI_API_KEY="your-key-here"
python main.py
```

On Windows PowerShell:

```powershell
$env:OPENAI_API_KEY="your-key-here"
python main.py
```

Alternatively, launch the application, open **Settings**, enter the key, and choose **Save encrypted**. The key is encrypted with a passphrase and must be loaded from Settings in future sessions.

## Running

```bash
python main.py
```

Recommended first session:

1. Open **Settings** and confirm model names available to your OpenAI account.
2. Select **Plan + Generate Opening Screen**.
3. Click a piece and then one of its highlighted legal destinations.
4. Use the Chronicle controls to revisit earlier scenes or return to the live position.
5. Regenerate any scene marked **QUALITY REVIEW / READ-ONLY**.

The default models are configured near `AppConfig` in `main.py` and can be changed at runtime in Settings.

## Quality Gate

A generated frame is playable only when both conditions pass:

- Board detection confidence is at least `0.65`.
- Observed position fidelity is at least `0.98`.

Vision retries can reduce audit noise, but they do not alter the generated image. If a piece is genuinely missing or incorrect, regenerate the frame. Thresholds and retry count are configurable in Settings.

The playable board is required to be top-down, axis-aligned, and free of perspective distortion because square hit-testing uses the detected rectangular board bounds.

## Controls

- **Plan + Generate Opening Screen** creates a new plan and first scene.
- **Regenerate Current Frame** renders the live engine position again.
- **GPT Move for Current Side** asks the configured model to choose from legal moves.
- **Undo Move** restores the engine and the newest matching Chronicle scene.
- **Earlier / Later / Live Position** navigates the Chronicle without changing chess state.
- **Export Frame Metadata JSON** exports the selected scene.
- **Export Chronicle Manifest** exports all scenes and the current game state.

Overlay controls expose the detected clickmap, text regions, legal targets, attack map, square labels, and click indicator.

## Local Files

By default, private application files are stored under:

```text
~/.worldshard_chess_secure/
```

Generated PNGs and their metadata are written to:

```text
~/.worldshard_chess_secure/outputs/
```

Encrypted settings are written to:

```text
~/.worldshard_chess_secure/settings.enc.json
```

Directories are created with user-only permissions where supported. Files are written atomically.

## Security Model

- API keys are never hardcoded or intentionally stored as plaintext.
- Saved settings use AES-256-GCM with a PBKDF2-HMAC-SHA256 derived key.
- Generated PNG structure, CRCs, dimensions, and size limits are checked before Tk loads an image.
- Model JSON is bounded, parsed as data, and sanitized before use.
- Generated code is never executed.
- There is no offline image or vision fallback that can silently bypass validation.

The application still sends prompts, chess positions, and generated images to the configured OpenAI APIs. API usage can incur text, vision, and image-generation charges.

## Troubleshooting

### `No module named tkinter`

Install your operating system's Tk package, such as `python3-tk` on Debian or Ubuntu.

### `No OpenAI client`

Set `OPENAI_API_KEY` or load an encrypted key through Settings.

### `Install cryptography first`

Activate the project environment and run:

```bash
python -m pip install -r requirements.txt
```

### Frame is read-only

Inspect the quality summary. Low board confidence means click geometry is uncertain; low position fidelity means the rendered pieces differ from the engine. Regenerate the scene rather than playing through a mismatched image.

### Image API did not return `b64_json`

Choose an image model that supports base64 PNG output and confirm that your account has access to it.

## Status

This is an experimental, API-only creative chess interface. The local engine and quality gate protect game state, but generative models can still produce rejected scenes, unreadable text, or inconsistent art direction. Image generation is the slowest and most expensive part of the loop.
