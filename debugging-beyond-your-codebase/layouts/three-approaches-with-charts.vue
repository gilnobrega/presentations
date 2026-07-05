<script setup lang="ts">
import SlideHeader from '../components/SlideHeader.vue'
import LawCard from '../components/LawCard.vue'

defineProps({
  part1Title: {
    type: String,
    default: 'Approach A'
  },
  part2Title: {
    type: String,
    default: 'Approach B'
  },
  part3Title: {
    type: String,
    default: 'Approach C'
  },
  separator: {
    type: Boolean,
    default: true
  }
})
</script>

<template>
  <div class="slidev-layout three-parts-layout bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col">
    <SlideHeader :separator="separator">
      <slot name="header" />
    </SlideHeader>
    
    <div class="grid grid-cols-[2fr_1fr] gap-10 flex-1 min-h-0 text-[#374151]">
      <!-- Left Column: Cards -->
      <div class="w-full min-w-0 min-h-0 flex flex-col parts-cards">
        <div v-click="1">
          <LawCard :title="part1Title">
            <slot name="part1" />
          </LawCard>
        </div>
        <div v-click="2">
          <LawCard :title="part2Title">
            <slot name="part2" />
          </LawCard>
        </div>
        <div v-click="3">
          <LawCard :title="part3Title">
            <slot name="part3" />
          </LawCard>
        </div>
      </div>
      
      <!-- Right Column: Charts Panel -->
      <div class="w-full min-w-0 min-h-0 flex items-stretch image-container">
        <section class="h-full w-full bg-white/70 p-5 rounded-xl border border-gray-200/80 shadow-sm text-[11px] leading-relaxed flex flex-col justify-between">
          <div class="font-bold text-gray-800 text-xs mb-3 border-b pb-2 flex items-center gap-1.5">
            📈 Effort Over Time Profiles
          </div>
          
          <!-- Approach A Chart -->
          <div v-click="1" class="flex items-center gap-3 border-b border-gray-100 pb-2">
            <div class="font-bold text-gray-800 text-sm w-4 text-center">A</div>
            <div class="flex-1 h-12">
              <svg class="w-full h-full" viewBox="0 0 160 46">
                <defs>
                  <linearGradient id="grad-layout-a" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="#ef4444" stop-opacity="0.2" />
                    <stop offset="100%" stop-color="#ef4444" stop-opacity="0" />
                  </linearGradient>
                </defs>
                <line x1="20" y1="8" x2="145" y2="8" stroke="#f9fafb" stroke-width="1" />
                <line x1="20" y1="6" x2="20" y2="34" stroke="#9ca3af" stroke-width="1.2" stroke-linecap="round" />
                <path d="M 20 4 L 18 8 L 22 8 Z" fill="#9ca3af" />
                <text x="12" y="20" transform="rotate(-90, 12, 20)" text-anchor="middle" font-size="7" fill="#6b7280" font-family="sans-serif">Effort</text>
                <line x1="20" y1="34" x2="150" y2="34" stroke="#9ca3af" stroke-width="1.2" stroke-linecap="round" />
                <path d="M 152 34 L 148 32 L 148 36 Z" fill="#9ca3af" />
                <text x="150" y="42" text-anchor="end" font-size="7" fill="#6b7280" font-family="sans-serif">Time</text>
                <path d="M 20 34 L 20 32 Q 115 34 145 8 L 145 34 Z" fill="url(#grad-layout-a)" />
                <path d="M 20 32 Q 115 34 145 8" fill="none" stroke="#ef4444" stroke-width="2.5" stroke-linecap="round" />
                <circle cx="20" cy="32" r="3" fill="#ef4444" />
                <circle cx="145" cy="8" r="3" fill="#ef4444" />
              </svg>
            </div>
          </div>

          <!-- Approach B Chart -->
          <div v-click="2" class="flex items-center gap-3 border-b border-gray-100 pb-2">
            <div class="font-bold text-gray-800 text-sm w-4 text-center">B</div>
            <div class="flex-1 h-12">
              <svg class="w-full h-full" viewBox="0 0 160 46">
                <defs>
                  <linearGradient id="grad-layout-b" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="#f59e0b" stop-opacity="0.2" />
                    <stop offset="100%" stop-color="#f59e0b" stop-opacity="0" />
                  </linearGradient>
                </defs>
                <line x1="20" y1="8" x2="145" y2="8" stroke="#f9fafb" stroke-width="1" />
                <line x1="20" y1="6" x2="20" y2="34" stroke="#9ca3af" stroke-width="1.2" stroke-linecap="round" />
                <path d="M 20 4 L 18 8 L 22 8 Z" fill="#9ca3af" />
                <text x="12" y="20" transform="rotate(-90, 12, 20)" text-anchor="middle" font-size="7" fill="#6b7280" font-family="sans-serif">Effort</text>
                <line x1="20" y1="34" x2="150" y2="34" stroke="#9ca3af" stroke-width="1.2" stroke-linecap="round" />
                <path d="M 152 34 L 148 32 L 148 36 Z" fill="#9ca3af" />
                <text x="150" y="42" text-anchor="end" font-size="7" fill="#6b7280" font-family="sans-serif">Time</text>
                <path d="M 20 34 L 20 21 L 145 21 L 145 34 Z" fill="url(#grad-layout-b)" />
                <path d="M 20 21 L 145 21" fill="none" stroke="#f59e0b" stroke-width="2.5" stroke-linecap="round" />
                <circle cx="20" cy="21" r="3" fill="#f59e0b" />
                <circle cx="145" cy="21" r="3" fill="#f59e0b" />
              </svg>
            </div>
          </div>

          <!-- Approach C Chart -->
          <div v-click="3" class="flex items-center gap-3 pb-1">
            <div class="font-bold text-gray-800 text-sm w-4 text-center">C</div>
            <div class="flex-1 h-12">
              <svg class="w-full h-full" viewBox="0 0 160 46">
                <defs>
                  <linearGradient id="grad-layout-c" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="#10b981" stop-opacity="0.2" />
                    <stop offset="100%" stop-color="#10b981" stop-opacity="0" />
                  </linearGradient>
                </defs>
                <line x1="20" y1="8" x2="145" y2="8" stroke="#f9fafb" stroke-width="1" />
                <line x1="20" y1="6" x2="20" y2="34" stroke="#9ca3af" stroke-width="1.2" stroke-linecap="round" />
                <path d="M 20 4 L 18 8 L 22 8 Z" fill="#9ca3af" />
                <text x="12" y="20" transform="rotate(-90, 12, 20)" text-anchor="middle" font-size="7" fill="#6b7280" font-family="sans-serif">Effort</text>
                <line x1="20" y1="34" x2="150" y2="34" stroke="#9ca3af" stroke-width="1.2" stroke-linecap="round" />
                <path d="M 152 34 L 148 32 L 148 36 Z" fill="#9ca3af" />
                <text x="150" y="42" text-anchor="end" font-size="7" fill="#6b7280" font-family="sans-serif">Time</text>
                <path d="M 20 34 L 20 8 Q 50 34 145 34 Z" fill="url(#grad-layout-c)" />
                <path d="M 20 8 Q 50 34 145 34" fill="none" stroke="#10b981" stroke-width="2.5" stroke-linecap="round" />
                <circle cx="20" cy="8" r="3" fill="#10b981" />
                <circle cx="145" cy="34" r="3" fill="#10b981" />
              </svg>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

<style>
.three-parts-layout {
  padding-top: 1.25rem !important;
  padding-bottom: 1.25rem !important;
}

.three-parts-layout .image-container {
  height: 100% !important;
  align-items: stretch !important;
  padding: 0 !important;
}

.three-parts-layout .image-container > div {
  height: 100% !important;
  align-items: stretch !important;
  justify-content: stretch !important;
}

.three-parts-layout h1 {
  margin-top: 0 !important;
  margin-bottom: 0.125rem !important;
}

.three-parts-layout p {
  margin-top: 0 !important;
  margin-bottom: 0.25rem !important;
  font-size: 0.85rem !important;
}

.three-parts-layout .parts-cards {
  height: 100% !important;
}

.three-parts-layout .parts-cards > * {
  height: 100% !important;
  display: flex !important;
  flex-direction: column !important;
  justify-content: space-between !important;
}

.three-parts-layout .law-card-component {
  margin-bottom: 0 !important;
}

.three-parts-layout .law-card-title {
  padding: 0.35rem 1rem !important;
  font-size: 0.95rem !important;
}

.three-parts-layout .law-card-body {
  padding: 0.15rem 1rem 0.35rem 1rem !important;
  line-height: 1.25 !important;
}

.three-parts-layout .law-card-body ul {
  list-style-type: none !important;
  padding-left: 0 !important;
  margin: 0 !important;
}

.three-parts-layout .law-card-body li {
  margin: 0 !important;
  padding: 0 !important;
  font-size: 0.8rem !important;
}

.three-parts-layout svg text {
  font-size: 5.5px !important;
  font-weight: 500 !important;
  fill: #9ca3af !important;
}
</style>
