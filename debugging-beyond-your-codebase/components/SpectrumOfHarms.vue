<template>
  <div class="spectrum-container">
    <div class="spectrum-axis">
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

    <div class="harms-list">
      <slot />
    </div>
  </div>
</template>

<style scoped>
</style>
