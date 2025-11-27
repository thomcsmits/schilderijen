---
layout: home
---

<div class="intro">
    <img align="left" src="{{ '/assets/img/general/corry.png' | relative_url }}" alt='Painting of older woman with a blue vest who is painting and facing to the left.'>
    <p>
        Corry Smits-Brand (12 december 1935 - 16 november 2025) hield van schilderen en heeft vele schilderijen gemaakt. Hier een overzicht van haar schilderijen.
    </p>
</div>

<hr class="section-divider">

{% assign paintings = site.data.paintings %}
{% assign categories = paintings | map: 'category' | uniq %}
<div class="filter-bar-wrapper">
  <div class="show-all-container">
    <button class="filter active" data-filter="all">Alle schilderijen</button>
  </div>
  <div class="filter-bar">
    {% for cat in categories %}
    <button class="filter" data-filter="{{ cat }}">
      {{ cat | capitalize }}
    </button>
    {% endfor %}
  </div>
</div>

<div class="gallery">
  {% for painting in paintings %}
  <div class="card {{ painting.category }}">
    <img src="{{ '/assets/img/paintings/' | relative_url }}{{ painting.image }}" 
         alt="{{ painting['image-alt'] | default: painting.title }}">
    <div class="info">
      <h3>{{ painting.title }}</h3>
      <span class="year">{{ painting.year }}</span>
    </div>
  </div>
  {% endfor %}
</div>

<div id="image-modal" class="modal">
  <span class="modal-close">&times;</span>
  <img class="modal-content" id="modal-img">
  <div class="modal-caption" id="modal-caption"></div>
</div>

<style>
.intro {
  display: flex;
  align-items: center;
  gap: 24px;
  padding: 20px;
  border-radius: 12px;

  background: linear-gradient(135deg, #fafafa, #f5f5f7);
  box-shadow: 0 2px 6px rgba(0,0,0,0.05);
  margin-bottom: 30px;
  max-width: 900px;
}

.intro img {
  width: 200px;
  height: auto;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  border: 10px solid #fff;
  object-fit: cover;
}

.section-divider {
  border: none;
  height: 1px;
  background: linear-gradient(to right, #ccc, #eee);
  margin: 40px 0 30px;
}

.filter-bar-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 30px;
  gap: 10px;
}

.show-all-container {
  width: 100%;
  display: flex;
  justify-content: center;
  margin-bottom: 10px;
}

.filter-bar {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 10px;
}

.filter {
  padding: 8px 16px;
  border: 1px solid #ccc;
  background: #f8f8f8;
  border-radius: 6px;
  cursor: pointer;
  font-size: 0.95rem;
  transition: background 0.2s ease, border-color 0.2s ease, transform 0.15s ease;
}

.filter:hover {
  background: #eee;
  border-color: #bbb;
  transform: translateY(-1px);
}

.filter.active {
  background: #333;
  border-color: #333;
  color: #fff;
}

.gallery {
  display: grid;
  gap: 25px;
  grid-template-columns: repeat(3, 1fr);
  margin-top: 20px;
}

.card {
  background: #fafafa;
  padding: 12px;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.08);
  transition: transform 0.12s ease;
}

.card:hover {
  transform: scale(1.02);
}

.card img {
  width: 100%;
  height: auto;
  border-radius: 8px;
}

.info {
  margin-top: 10px;
}

.info h3 {
  margin: 0;
  font-size: 1.1rem;
}

.info .year {
  color: #777;
  font-size: 0.9rem;
}

.modal {
  display: none; 
  position: fixed;
  z-index: 1000;
  padding-top: 40px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background: rgba(0,0,0,0.7);
  backdrop-filter: blur(3px);
}

@media (max-width: 680px) {
  .intro {
    flex-direction: column;
    text-align: center;
    gap: 16px;
    padding: 16px;
  }

  .intro img {
    width: 140px;
  }

  .section-divider {
    margin: 30px 0 20px;
  }

  .gallery {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .card {
    padding: 10px;
  }

  .info h3 {
    font-size: 1.05rem;
  }
}
</style>

<script>
document.querySelectorAll(".filter").forEach(btn => {
  btn.addEventListener("click", () => {
    const selected = btn.dataset.filter;
    const cards = document.querySelectorAll(".card");

    cards.forEach(card => {
      if (selected === "all" || card.classList.contains(selected)) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });

    document.querySelectorAll(".filter").forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
  });
});
</script>
