<script setup lang="ts">
import { computed } from 'vue'
import { useNav } from '@slidev/client'

const nav = useNav()

const currentSection = computed(() => {
  const currentPage = nav.currentPage.value
  const slides = nav.slides.value
  
  // Look backwards from the current slide to find the last defined section in frontmatter
  for (let i = currentPage - 1; i >= 0; i--) {
    const route = slides[i]
    // Slidev stores frontmatter in route.meta.slide.frontmatter or route.meta.frontmatter
    const fm = route?.meta?.slide?.frontmatter || route?.meta?.frontmatter
    if (fm && fm.section) {
      return fm.section
    }
  }
  return '' // Default if no section is found
})
</script>

<template>
  <footer
    v-if="$slidev.nav.currentLayout !== 'cover'"
    class="absolute bottom-4 left-12 right-12 flex justify-between items-center text-sm font-semibold z-50 pointer-events-none"
  >
    <!-- Left side: Section Name -->
    <div class="text-[#3b82f6] opacity-80 uppercase tracking-wider text-xs">
      {{ currentSection }}
    </div>
    
    <!-- Right side: Page Number -->
    <div class="text-[#374151] opacity-60">
      {{ $slidev.nav.currentPage }} <span class="opacity-50">/ {{ $slidev.nav.total }}</span>
    </div>
  </footer>
</template>
