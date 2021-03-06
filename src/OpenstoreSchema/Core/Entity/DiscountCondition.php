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
 *   name="discount_condition",
 *   uniqueConstraints={
 *     @ORM\UniqueConstraint(name="unique_legacy_mapping_idx",columns={"legacy_mapping"})
 *   },
 *   indexes={
 *     @ORM\Index(name="valid_from_idx", columns={"valid_from"}),
 *     @ORM\Index(name="valid_till_idx", columns={"valid_till"}),
 *   },
 *   options={
 *     "comment" = "Discount conditions table",
 *     "charset"="utf8mb4",
 *     "collate"="utf8mb4_unicode_ci"
 *   }
 * )
 */
class DiscountCondition
{
    /**
     * @ORM\Id
     * @ORM\Column(name="id", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Pricelist", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="pricelist_id", referencedColumnName="pricelist_id", onDelete="CASCADE", nullable=true)
     */
    private $pricelist_id;

    /**
     * @ORM\ManyToOne(targetEntity="CustomerGroup", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="customer_group_id", referencedColumnName="group_id", onDelete="CASCADE", nullable=true)
     */
    private $customer_group_id;

    /**
     * @ORM\ManyToOne(targetEntity="Customer", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="customer_id", referencedColumnName="customer_id", onDelete="CASCADE", nullable=true)
     */
    private $customer_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductBrand", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="brand_id", referencedColumnName="brand_id", onDelete="CASCADE", nullable=true)
     */
    private $brand_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductGroup", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="product_group_id", referencedColumnName="group_id", onDelete="CASCADE", nullable=true)
     */
    private $product_group_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductModel", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="model_id", referencedColumnName="model_id", onDelete="CASCADE", nullable=true)
     */
    private $model_id;

    /**
     * @ORM\ManyToOne(targetEntity="ProductCategory", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="category_id", referencedColumnName="category_id", onDelete="CASCADE", nullable=true)
     */
    private $category_id;

    /**
     * @ORM\ManyToOne(targetEntity="Product", inversedBy="discounts", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="product_id", referencedColumnName="product_id", onDelete="CASCADE", nullable=true)
     */
    private $product_id;

    /**
     * @ORM\Column(type="decimal", precision=9, scale=6, nullable=false, options={"default"=0, "comment"="Regular discount 1"})
     */
    private $discount_1;

    /**
     * @ORM\Column(type="decimal", precision=9, scale=6, nullable=false, options={"default"=0, "comment"="Regular discount 2"})
     */
    private $discount_2;

    /**
     * @ORM\Column(type="decimal", precision=9, scale=6, nullable=false, options={"default"=0, "comment"="Regular discount 3"})
     */
    private $discount_3;

    /**
     * @ORM\Column(type="decimal", precision=9, scale=6, nullable=false, options={"default"=0, "comment"="Regular discount 4"})
     */
    private $discount_4;

    /**
     * @ORM\Column(type="decimal", precision=12, scale=6, nullable=true, options={"comment"="Fixed price, only for products"})
     */
    private $fixed_price;

    /**
     * @ORM\Column(type="date", nullable=true, options={"comment" = "Discount valid from"})
     */
    private $valid_from;

    /**
     * @ORM\Column(type="date", nullable=true, options={"comment" = "Discount valid till"})
     */
    private $valid_till;

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
     * @ORM\Column(type="string",length=80,nullable=true, options={"comment" = "Unique reference of this record taken from legacy system"})
     */
    protected $legacy_mapping;

    /**
     * @ORM\Column(type="datetime",nullable=true, options={"comment" = "Last synchro timestamp"})
     */
    protected $legacy_synchro_at;

    public function __construct()
    {
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $pricelist_id
     */
    public function setPricelistId($pricelist_id)
    {
        $this->pricelist_id = $pricelist_id;
    }

    /**
     * @return int
     */
    public function getPricelistId()
    {
        return $this->pricelist_id;
    }

    /**
     * @param int $customer_id
     */
    public function setCustomerId($customer_id)
    {
        $this->customer_id = $customer_id;
    }

    /**
     * @return int
     */
    public function getCustomerId()
    {
        return $this->customer_id;
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
     * @param int $model_id
     */
    public function setModelId($model_id)
    {
        $this->model_id = $model_id;
    }

    /**
     * @return int
     */
    public function getModelId()
    {
        return $this->model_id;
    }

    /**
     * @param int $category_id
     */
    public function setCategoryId($category_id)
    {
        $this->category_id = $category_id;
    }

    /**
     * @return int
     */
    public function getCategoryId()
    {
        return $this->category_id;
    }

    /**
     * @param int $product_group_id
     */
    public function setProductGroupId($product_group_id)
    {
        $this->product_group_id = $product_group_id;
    }

    /**
     * @return int
     */
    public function getProductGroupId()
    {
        return $this->product_group_id;
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

    public function getCreatedAt(): ?string
    {
        return $this->created_at;
    }

    public function setCreatedAt(string $created_at): void
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
}
