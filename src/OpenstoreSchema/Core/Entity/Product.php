<?php

/*
 * opentore-schema-core
 *
 * @author    Vanvelthem Sébastien
 * @link      https://github.com/belgattitude/openstore-schema-core
 * @copyright Copyright (c) 2015-2017 Vanvelthem Sébastien
 * @license   MIT License, https://github.com/belgattitude/openstore-schema-core/blob/master/LICENSE.md
 *
 */

namespace OpenstoreSchema\Core\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity
 * @ORM\Table(
 *   name="product",
 *   uniqueConstraints={
 *     @ORM\UniqueConstraint(name="unique_reference_idx",columns={"reference", "brand_id", "flag_active"}),
 *     @ORM\UniqueConstraint(name="unique_legacy_mapping_idx",columns={"legacy_mapping"}),
 *     @ORM\UniqueConstraint(name="unique_slug_idx",columns={"slug"})
 *   },
 *   indexes={
 *     @ORM\Index(name="title_idx", columns={"title"}),
 *     @ORM\Index(name="flag_active_idx", columns={"flag_active"}),
 *     @ORM\Index(name="reference_idx", columns={"reference"}),
 *     @ORM\Index(name="search_reference_idx", columns={"search_reference"}),
 *     @ORM\Index(name="barcode_ean13_idx", columns={"barcode_ean13"}),
 *     @ORM\Index(name="barcode_upca_idx", columns={"barcode_upca"}),
 *     @ORM\Index(name="keywords_idx", columns={"keywords"}),
 *     @ORM\Index(name="slug_idx", columns={"slug"}),
 *   },
 *   options={
 *     "comment" = "Product table",
 *     "charset"="utf8mb4",
 *     "collate"="utf8mb4_unicode_ci",
 *     "row_format" = "DYNAMIC"
 *   }
 * )
 * @Gedmo\SoftDeleteable(fieldName="deleted_at")
 */
class Product
{
    /**
     * @ORM\Id
     * @ORM\Column(name="product_id", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $product_id;

    /**
     * @ORM\Column(type="string", length=60, nullable=false, options={"comment" = "Unique reference, may include supplier information to maintain uniqueness"})
     */
    private $reference;

    /**
     * @ORM\Column(type="string", length=60, nullable=true, options={"comment" = "Displayable reference, without extra info to maintain uniqueness"})
     */
    private $display_reference;

    /**
     * @ORM\Column(type="string", length=60, nullable=true, options={"comment" = "Reference used for searches, may differ from display reference, some chars may be replaced"})
     */
    private $search_reference;

    /**
     * @ORM\ManyToOne(targetEntity="Product", inversedBy="children")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="product_id", onDelete="CASCADE", nullable=true)
     */
    private $parent_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductBrand", inversedBy="products", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="brand_id", referencedColumnName="brand_id", onDelete="CASCADE", nullable=true)
     */
    private $brand_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductGroup", inversedBy="products", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="group_id", referencedColumnName="group_id", onDelete="CASCADE", nullable=true)
     */
    private $group_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductModel", inversedBy="models", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="model_id", referencedColumnName="model_id", onDelete="CASCADE", nullable=true)
     */
    private $model_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductSerie", inversedBy="series", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="serie_id", referencedColumnName="serie_id", onDelete="CASCADE", nullable=true)
     */
    private $serie_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductCategory", inversedBy="categories", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="category_id", referencedColumnName="category_id", onDelete="CASCADE", nullable=true)
     */
    private $category_id;

    /**
     * Type id.
     *
     * @ORM\ManyToOne(targetEntity="ProductType", inversedBy="products", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="type_id", referencedColumnName="type_id", onDelete="CASCADE", nullable=true)
     */
    private $type_id;

    /**
     * Status id.
     *
     * @ORM\ManyToOne(targetEntity="ProductStatus", inversedBy="products", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="status_id", referencedColumnName="status_id", onDelete="CASCADE", nullable=true)
     */
    private $status_id;

    /**
     * Sales unit.
     *
     * @ORM\ManyToOne(targetEntity="ProductUnit", inversedBy="products", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="unit_id", referencedColumnName="unit_id", onDelete="CASCADE", nullable=true)
     */
    private $unit_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductStub", inversedBy="stubs", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="product_stub_id", referencedColumnName="product_stub_id", onDelete="CASCADE", nullable=true)
     */
    private $product_stub_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductDepartment", inversedBy="products", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="department_id", referencedColumnName="department_id", onDelete="CASCADE", nullable=true)
     */
    private $primary_department_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductTarget", inversedBy="products", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="target_id", referencedColumnName="target_id", onDelete="CASCADE", nullable=true)
     */
    private $target_id;

    /**
     * Primary color id.
     *
     * @ORM\ManyToOne(targetEntity="Color", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="primary_color_id", referencedColumnName="color_id", onDelete="CASCADE", nullable=true)
     */
    private $primary_color_id;

    /**
     * @Gedmo\Slug(fields={"title"})
     * @ORM\Column(length=255, nullable=true, options={"comment" = "Unique slug for this record"})
     */
    private $slug;

    /**
     * @ORM\Column(type="string", length=150, nullable=true)
     */
    private $title;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     */
    private $invoice_title;

    /**
     * @ORM\Column(type="string", length=15000, nullable=true)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=150, nullable=true)
     */
    private $characteristic;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $keywords;

    /**
     * @ORM\Column(type="decimal", precision=12, scale=6, nullable=true, options={"comment"="Volume per sales unit in m3"})
     */
    private $volume;

    /**
     * @ORM\Column(type="decimal", precision=12, scale=6, nullable=true, options={"comment"="Net weight per sales unit in Kg"})
     */
    private $weight;

    /**
     * @ORM\Column(type="decimal", precision=12, scale=6, nullable=true, options={"comment"="Gross weight per sales unit in Kg"})
     */
    private $weight_gross;

    /**
     * @ORM\Column(type="decimal", precision=12, scale=6, nullable=true, options={"comment"="Length per sales unit in meter"})
     */
    private $length;

    /**
     * @ORM\Column(type="decimal", precision=12, scale=6, nullable=true, options={"comment"="Heigth per sales unit in meter"})
     */
    private $height;

    /**
     * @ORM\Column(type="decimal", precision=12, scale=6, nullable=true, options={"comment"="Width per sales unit in meter"})
     */
    private $width;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=8, nullable=true, options={"comment"="Diameter in meter"})
     */
    private $diameter;

    /**
     * @ORM\Column(type="string", length=10, nullable=true, options={"comment"="Format, i.e. 10x10.."})
     */
    private $format;

    /**
     * @ORM\Column(type="decimal", precision=15, scale=6, nullable=true, options={"comment"="Packaging items per box"})
     */
    private $pack_qty_box;

    /**
     * @ORM\Column(type="decimal", precision=15, scale=6, nullable=true, options={"comment"="Packaging items per carton"})
     */
    private $pack_qty_carton;

    /**
     * @ORM\Column(type="decimal", precision=15, scale=6, nullable=true, options={"comment"="Packaging items per master carton"})
     */
    private $pack_qty_master_carton;

    /**
     * @ORM\Column(type="decimal", precision=15, scale=6, nullable=true, options={"comment"="Packaging items per palet"})
     */
    private $pack_qty_palet;

    /**
     * @ORM\Column(type="string", length=13, nullable=true, options={"comment"="EAN13 barcode"})
     */
    private $barcode_ean13;

    /**
     * @ORM\Column(type="string", length=20, nullable=true, options={"comment"="UPCA barcode"})
     */
    private $barcode_upca;

    /**
     * @ORM\Column(type="boolean", nullable=false, options={"default"=1, "comment"="Whether the product is active in public website"})
     */
    private $flag_active;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $sort_index;

    /**
     * @ORM\Column(type="date", nullable=true, options={"comment" = "Date on which product was made available"})
     */
    private $available_at;

    /**
     * @ORM\Column(type="date", nullable=true, options={"comment" = "Date on which product was/will be made unavailable"})
     */
    private $unavailable_at;

    /**
     * @ORM\Column(type="string", length=40, nullable=true)
     */
    private $icon_class;

    /**
     * @ORM\Column(type="string", length=20, nullable=true, options={"comment"="European intrastat customs code"})
     */
    private $trade_code_intrastat;

    /**
     * @ORM\Column(type="string", length=20, nullable=true, options={"comment"="International Harmonized Trade System common nomenclature code"})
     */
    private $trade_code_hts;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime", nullable=true, options={"comment" = "Record creation timestamp"})
     */
    private $created_at;

    /**
     * @Gedmo\Timestampable(on="update")
     * @ORM\Column(type="datetime", nullable=true, options={"comment" = "Record last update timestamp"})
     */
    private $updated_at;

    /**
     * @ORM\Column(type="datetime", nullable=true, options={"comment" = "Record deletion date"})
     */
    private $deleted_at;

    /**
     * @Gedmo\Blameable(on="create")
     * @ORM\Column(type="string", length=40, nullable=true, options={"comment" = "Creator name"})
     */
    private $created_by;

    /**
     * @Gedmo\Blameable(on="update")
     * @ORM\Column(type="string", length=40, nullable=true, options={"comment" = "Last updater name"})
     */
    private $updated_by;

    /**
     * @ORM\Column(type="string",length=40,nullable=true, options={"comment" = "Unique reference of this record taken from legacy system"})
     */
    protected $legacy_mapping;

    /**
     * @ORM\Column(type="datetime",nullable=true, options={"comment" = "Last synchro timestamp"})
     */
    protected $legacy_synchro_at;

    public function __construct()
    {
        /*
         * Default value for flag_active
         */
        $this->flag_active = true;
    }

    /**
     * @param int $product_id
     */
    public function setProductId($product_id)
    {
        $this->product_id = $product_id;
    }

    /**
     * @return int
     */
    public function getProductId()
    {
        return $this->product_id;
    }

    /**
     * Set reference.
     *
     * @param string $reference
     */
    public function setReference($reference)
    {
        $this->reference = $reference;
    }

    /**
     * Return reference.
     *
     * @return string
     */
    public function getReference()
    {
        return $this->reference;
    }

    /**
     * @param string $slug
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;
    }

    /**
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @param string $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param string $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param int $type_id
     */
    public function setTypeId($type_id)
    {
        $this->type_id = $type_id;
    }

    /**
     * @return int
     */
    public function getTypeId()
    {
        return $this->type_id;
    }

    /**
     * @param int $group_id
     */
    public function setGroupId($group_id)
    {
        $this->group_id = $group_id;
    }

    /**
     * @return int
     */
    public function getGroupId()
    {
        return $this->group_id;
    }

    /**
     * @param int $brand_id
     */
    public function setBrandId($brand_id)
    {
        $this->brand_id = $brand_id;
    }

    /**
     * @return int
     */
    public function getBrandId()
    {
        return $this->brand_id;
    }

    /**
     * @param int $status_id
     */
    public function setStatusId($status_id)
    {
        $this->status_id = $status_id;
    }

    /**
     * @return int|null
     */
    public function getStatusId()
    {
        return $this->status_id;
    }

    /**
     * @param float $unit_id
     */
    public function setUnitId($unit_id)
    {
        $this->unit_id = $unit_id;
    }

    /**
     * @return int
     */
    public function getUnitId()
    {
        return $this->unit_id;
    }

    public function setVolume($volume)
    {
        $this->volume = $volume;
    }

    /**
     * @return float
     */
    public function getVolume()
    {
        return $this->volume;
    }

    public function setWeight($weight)
    {
        $this->weight = $weight;
    }

    /**
     * @return float
     */
    public function getWeight()
    {
        return $this->weight;
    }

    public function setLength($length)
    {
        $this->length = $length;
    }

    /**
     * @return float
     */
    public function getLength()
    {
        return $this->length;
    }

    public function setHeight($height)
    {
        $this->height = $height;
    }

    /**
     * @return float
     */
    public function getHeight()
    {
        return $this->height;
    }

    public function setWidth($width)
    {
        $this->width = $width;
    }

    /**
     * @return float
     */
    public function getWidth()
    {
        return $this->width;
    }

    public function setBarcodeEan13($barcode_ean13)
    {
        $this->barcode_ean13 = $barcode_ean13;
    }

    /**
     * @return string
     */
    public function getBarcodeEan13()
    {
        return $this->barcode_ean13;
    }

    public function setIconClass($icon_class)
    {
        $this->icon_class = $icon_class;
    }

    /**
     * @return string
     */
    public function getIconClass()
    {
        return $this->icon_class;
    }

    /**
     * @return string
     */
    public function getTradeCodeHts()
    {
        return $this->trade_code_hts;
    }

    /**
     * @param string $code
     */
    public function setTradeCodeHts($code)
    {
        $this->trade_code_hts = $code;
    }

    /**
     * @param string $code
     */
    public function setTradeCodeIntrastat($code)
    {
        $this->trade_code_intrastat = $code;
    }

    /**
     * @return string
     */
    public function getTradeCodeIntrastat()
    {
        return $this->trade_code_intrastat;
    }

    /**
     * @return bool
     */
    public function getFlagActive()
    {
        return (bool) $this->flag_active;
    }

    public function setFlagActive($flag_active)
    {
        $this->flag_active = $flag_active;
    }

    public function getAvailableAt(): ?string
    {
        return $this->available_at;
    }

    /**
     * @param string $available_at date in Y-m-d H:i:s format
     */
    public function setAvailableAt(string $available_at): void
    {
        $this->available_at = $available_at;
    }

    /**
     * @return string
     */
    public function getCreatedAt()
    {
        return $this->created_at;
    }

    /**
     * @param string $created_at
     */
    public function setCreatedAt($created_at)
    {
        $this->created_at = $created_at;
    }

    /**
     * @return string
     */
    public function getUpdatedAt()
    {
        return $this->updated_at;
    }

    /**
     * @param string $updated_at
     */
    public function setUpdatedAt($updated_at)
    {
        $this->updated_at = $updated_at;
    }

    /**
     * @return string
     */
    public function getDeletedAt()
    {
        return $this->deleted_at;
    }

    /**
     * @param string $deleted_at
     */
    public function setDeletedAt($deleted_at)
    {
        $this->deleted_at = $deleted_at;
    }

    /**
     * Return creator username.
     *
     * @return string
     */
    public function getCreatedBy()
    {
        return $this->created_by;
    }

    /**
     * Set creator username.
     *
     * @param string $created_by
     */
    public function setCreatedBy($created_by)
    {
        $this->created_by = $created_by;
    }

    /**
     * Return last updater username.
     *
     * @return string
     */
    public function getUpdatedBy()
    {
        return $this->updated_by;
    }

    /**
     * Set the last updater username.
     *
     * @param string $updated_by
     */
    public function setUpdatedBy($updated_by)
    {
        $this->updated_by = $updated_by;
    }

    /**
     * Return legacy mapping.
     *
     * @return string $legacy_mapping
     */
    public function getLegacyMapping()
    {
        return $this->legacy_mapping;
    }

    /**
     * Set a legacy mapping for this record.
     *
     * @param string $legacy_mapping
     */
    public function setLegacyMapping($legacy_mapping)
    {
        $this->legacy_mapping = $legacy_mapping;
    }

    /**
     * Set legacy synchro time.
     *
     * @param string $legacy_synchro_at
     */
    public function setLegacySynchroAt($legacy_synchro_at)
    {
        $this->legacy_synchro_at = $legacy_synchro_at;
    }

    /**
     * Return legacy synchro timestamp.
     *
     * @return string
     */
    public function getLegacySynchroAt()
    {
        return $this->legacy_synchro_at;
    }

    /**
     * @return string
     */
    public function __toString()
    {
        return $this->getTitle();
    }
}
