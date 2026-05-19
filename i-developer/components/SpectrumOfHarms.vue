<template>
  <div class="spectrum-container">
    <!-- Gradient Axis on the left -->
    <div class="spectrum-axis">
      <!-- Side labels to the left of the axis -->
      <span class="side-label top">Developer</span>
      <span class="side-label bottom">End User</span>

      <div class="axis-label top">
        Direct Harm
      </div>
      <div class="arrow-track"></div>
      <div class="arrow-head"></div>
      <div class="axis-label bottom">
        Indirect Harm
      </div>
    </div>

    <!-- List of Harms on the right -->
    <div class="harms-list">
      <slot />
    </div>
  </div>
</template>

<style scoped>
/* Scoped adjustments to keep styling localized if needed, but core layout rules are globally managed in index.css */
</style>
