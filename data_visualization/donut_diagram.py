import matplotlib.pyplot as plt

# Outer ring (high-level categories)
inner_labels = ['Syntax', 'Functional', 'Semantic', 'Synthesis']
inner_sizes  = [25, 25, 25, 25]

# Inner ring (subcategories)
outer_labels = [
    'A1', 'A2', 'B1', 'B2', 'B3', 'C1', 'C2'
]
outer_sizes  = [15, 25, 10, 15, 10, 10, 15]

fig, ax = plt.subplots()

# First (outer) ring
ax.pie(
    outer_sizes,
    labels=outer_labels,
    radius=1.0,              # radius of outer ring
    wedgeprops=dict(width=0.3, edgecolor='white')
)

# Second (inner) ring
ax.pie(
    inner_sizes,
    labels=inner_labels,
    radius=0.7,              # smaller radius for inner ring
    wedgeprops=dict(width=0.3, edgecolor='white')
)

# Equal aspect ratio ensures the pie is drawn as a circle.
ax.set(aspect="equal")
plt.show()
