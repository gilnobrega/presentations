<script setup lang="ts">
const props = defineProps({
  clicks: {
    type: Number,
    default: 0
  }
})
</script>

<template>
  <div class="iceberg-container">
    <svg viewBox="0 0 500 500" class="iceberg-svg">
      <defs>
        <!-- Ocean Depth Gradient for the water body overlay -->
        <linearGradient id="ocean-overlay" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stop-color="#0284c7" stop-opacity="0.55" />
          <stop offset="35%" stop-color="#0369a1" stop-opacity="0.8" />
          <stop offset="100%" stop-color="#083344" stop-opacity="0.95" />
        </linearGradient>

        <!-- Glow for submerged iceberg to make it pop underwater -->
        <filter id="underwater-glow" x="-20%" y="-20%" width="140%" height="140%">
          <feGaussianBlur stdDeviation="6" result="blur" />
          <feComponentTransfer in="blur" result="brightBlur">
            <feFuncA type="linear" slope="0.8"/>
          </feComponentTransfer>
          <feMerge>
            <feMergeNode in="brightBlur" />
            <feMergeNode in="SourceGraphic" />
          </feMerge>
        </filter>
      </defs>

      <!-- ZOOM WRAPPER: Handles the camera zoom-out animation -->
      <g :class="['iceberg-zoom-group', { 'zoomed-in': props.clicks === 0, 'zoomed-out': props.clicks >= 1 }]">
        
        <!-- 1. SUBMERGED ICEBERG BODY (Visible only when clicks >= 1 / zoomed-out) -->
        <g :class="['submerged-group', { 'visible': props.clicks >= 1 }]" filter="url(#underwater-glow)">
          <!-- Facet 1 (Left far) -->
          <polygon points="150,150 120,200 80,290 160,300" fill="#0284c7" opacity="0.65" />
          <!-- Facet 2 (Left inner) -->
          <polygon points="150,150 160,300 210,280 250,150" fill="#38bdf8" opacity="0.75" />
          <!-- Facet 3 (Left bottom) -->
          <polygon points="80,290 110,380 180,440 160,300" fill="#0369a1" opacity="0.7" />
          <!-- Facet 4 (Bottom tip) -->
          <polygon points="160,300 180,440 250,470 210,280" fill="#0ea5e9" opacity="0.85" />
          <!-- Facet 5 (Right inner) -->
          <polygon points="250,150 210,280 250,470 310,290 330,150" fill="#0284c7" opacity="0.8" />
          <!-- Facet 6 (Right far) -->
          <polygon points="330,150 360,210 390,320 310,290" fill="#1e40af" opacity="0.65" />
          <!-- Facet 7 (Right bottom) -->
          <polygon points="390,320 320,430 250,470 310,290" fill="#1d4ed8" opacity="0.8" />

          <!-- Highlight lines for submerged structure -->
          <polyline points="150,150 160,300 180,440" fill="none" stroke="#e0f2fe" stroke-width="1.5" opacity="0.35" />
          <polyline points="250,150 210,280 250,470" fill="none" stroke="#e0f2fe" stroke-width="2" opacity="0.45" />
          <polyline points="330,150 310,290 320,430" fill="none" stroke="#93c5fd" stroke-width="1.5" opacity="0.35" />
        </g>

        <!-- 2. WATER OVERLAY -->
        <path d="M 0,150 Q 125,145 250,150 T 500,150 L 500,500 L 0,500 Z" fill="url(#ocean-overlay)" />

        <!-- 3. WATER SURFACE WAVES -->
        <g class="water-surface-group">
          <!-- Back Wave -->
          <path d="M 0,150 Q 125,142 250,150 T 500,150 L 500,165 L 0,165 Z" fill="#0284c7" opacity="0.4" class="wave-back" />
          <!-- Front Wave / Water Line -->
          <path d="M 0,150 Q 125,145 250,150 T 500,150 L 500,500 L 0,500 Z" fill="none" stroke="#bae6fd" stroke-width="2" opacity="0.8" class="wave-front" />
        </g>

        <!-- 4. ABOVE WATER TIP (Always visible) -->
        <g class="tip-group">
          <!-- Facet A (Left lit facet) -->
          <polygon points="240,25 170,90 220,85" fill="#ffffff" stroke="#f0f9ff" stroke-width="0.5" />
          <!-- Facet B1 (Left mid) -->
          <polygon points="170,90 150,150 220,85" fill="#f0f9ff" stroke="#e0f2fe" stroke-width="0.5" />
          <!-- Facet B2 (Left bottom) -->
          <polygon points="220,85 150,150 250,150" fill="#e0f2fe" stroke="#bae6fd" stroke-width="0.5" />
          <!-- Facet C (Right shadow facet) -->
          <polygon points="240,25 220,85 250,150 300,75" fill="#bae6fd" stroke="#93c5fd" stroke-width="0.5" />
          <!-- Facet D (Right outer shadow) -->
          <polygon points="300,75 250,150 330,150" fill="#93c5fd" stroke="#60a5fa" stroke-width="0.5" />
          
          <!-- Peak ridge line highlight -->
          <line x1="240" y1="25" x2="250" y2="150" stroke="#ffffff" stroke-width="2.5" opacity="0.9" />
          <!-- Secondary ridge line -->
          <line x1="240" y1="25" x2="220" y2="85" stroke="#ffffff" stroke-width="1.5" opacity="0.75" />
        </g>

      </g>
    </svg>

    <!-- 6. HTML-BASED LABELS -->
    <!-- Public Issues Label -->
    <div :class="['label-html', 'public-label', props.clicks === 0 ? 'zoomed-in-label' : 'zoomed-out-label']">
      <div class="label-title-wrapper">
        <span class="label-title">Public Issues (GitHub)</span>
      </div>
      <span class="label-subtitle">18,000+ known issues (public)</span>
    </div>

    <!-- Private Issues Label (Visible only when clicks >= 1 / zoomed-out) -->
    <div :class="['label-html', 'private-label', { 'visible': props.clicks >= 1 }]">
      <div class="label-title-wrapper">
        <span class="label-title">Private Issues (Google Internal)</span>
      </div>
      <span class="label-subtitle">Google customer reports & private tracker</span>
    </div>
  </div>
</template>

<style scoped>
.iceberg-container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  background: transparent;
}

.iceberg-svg {
  width: 100%;
  height: auto;
  max-width: 420px;
  max-height: 420px;
}

/* Zoom Group Animation */
.iceberg-zoom-group {
  transition: transform 1.8s cubic-bezier(0.25, 1, 0.5, 1);
  transform-origin: 250px 90px;
}

.iceberg-zoom-group.zoomed-in {
  transform: scale(2.1) translate(0px, 45px);
}

.iceberg-zoom-group.zoomed-out {
  transform: scale(1) translate(0, 0);
}

/* Submerged Part Fade-in */
.submerged-group {
  opacity: 0;
  transition: opacity 1.5s cubic-bezier(0.25, 1, 0.5, 1);
}

.submerged-group.visible {
  opacity: 1;
}

/* Connectors */
.connector-group {
  opacity: 0;
  transition: opacity 1s cubic-bezier(0.25, 1, 0.5, 1);
}

.connector-group.visible {
  opacity: 1;
}

/* Above water tip gentle float */
.tip-group {
  animation: float-tip 6s ease-in-out infinite;
}

/* HTML Labels Styling */
.label-html {
  position: absolute;
  padding: 8px 12px;
  border-radius: 6px;
  display: flex;
  flex-direction: column;
  gap: 2px;
  backdrop-filter: blur(4px);
  pointer-events: none;
  z-index: 10;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

/* Coordinated transitions for public label */
.public-label {
  background: rgba(255, 255, 255, 0.95);
  border: 1px solid rgba(226, 232, 240, 0.9);
  transition: opacity 1.8s cubic-bezier(0.25, 1, 0.5, 1),
              transform 1.8s cubic-bezier(0.25, 1, 0.5, 1),
              top 1.8s cubic-bezier(0.25, 1, 0.5, 1),
              left 1.8s cubic-bezier(0.25, 1, 0.5, 1),
              width 1.8s cubic-bezier(0.25, 1, 0.5, 1);
}

/* Position public label when zoomed in */
.public-label.zoomed-in-label {
  top: 25%;
  left: 20%;
  width: 200px;
  transform: scale(1.15);
}

/* Position public label when zoomed out */
.public-label.zoomed-out-label {
  top: 6%;
  left: 6%;
  width: 175px;
  transform: scale(1);
}

/* Coordinated transitions for private label */
.private-label {
  top: 52%;
  left: 6%;
  width: 220px;
  background: rgba(15, 23, 42, 0.93);
  border: 1px solid rgba(30, 41, 59, 0.8);
  box-shadow: 0 12px 20px rgba(0, 0, 0, 0.25);
  
  opacity: 0;
  transform: scale(0.9) translateY(20px);
  transition: opacity 1s cubic-bezier(0.25, 1, 0.5, 1),
              transform 1.2s cubic-bezier(0.25, 1, 0.5, 1);
  /* Delay showing private label until the zoom-out is partially finished */
  transition-delay: 0.6s;
}

.private-label.visible {
  opacity: 1;
  transform: scale(1) translateY(0);
}

.label-title {
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: -0.01em;
}

.public-label .label-title {
  color: #0f172a;
}

.private-label .label-title {
  color: #f8fafc;
}

.label-subtitle {
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  font-size: 9px;
  font-weight: 500;
  line-height: 1.25;
}

.public-label .label-subtitle {
  color: #64748b;
}

.private-label .label-subtitle {
  color: #94a3b8;
}

.badge-warning {
  display: flex;
  align-items: center;
  gap: 5px;
  margin-top: 4px;
}

.pulse-dot-element {
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: #ef4444;
  animation: pulse-dot-anim 2s ease-in-out infinite;
}

.badge-text {
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  font-size: 8px;
  font-weight: 600;
  color: #ef4444;
}

/* Wavy animations and details */
@keyframes float-tip {
  0% { transform: translateY(0); }
  50% { transform: translateY(-3px); }
  100% { transform: translateY(0); }
}

@keyframes wave-back-move {
  0% { transform: translateX(0); }
  50% { transform: translateX(-8px); }
  100% { transform: translateX(0); }
}

@keyframes wave-front-move {
  0% { transform: translateX(0); }
  50% { transform: translateX(6px); }
  100% { transform: translateX(0); }
}

.wave-back {
  animation: wave-back-move 8s ease-in-out infinite;
}

.wave-front {
  animation: wave-front-move 6s ease-in-out infinite;
}

@keyframes pulse-dot-anim {
  0% { transform: scale(1); opacity: 0.5; }
  50% { transform: scale(1.3); opacity: 1; }
  100% { transform: scale(1); opacity: 0.5; }
}
</style>
