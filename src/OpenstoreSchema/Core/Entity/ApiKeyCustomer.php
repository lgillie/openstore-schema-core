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
 *   name="api_key_customer",
 *   uniqueConstraints={
 *     @ORM\UniqueConstraint(name="unique_api_cutomer_idx",columns={"api_id", "customer_id"}),
 *     @ORM\UniqueConstraint(name="unique_legacy_mapping_idx",columns={"legacy_mapping"}),
 *   },
 *   options={
 *     "comment" = "Api key customers",
 *      "charset"="utf8mb4",
 *      "collate"="utf8mb4_unicode_ci"
 *   }
 * )
 */
class ApiKeyCustomer
{
    /**
     * @ORM\Id
     * @ORM\Column(name="id", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="ApiKey", inversedBy="services", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="api_id", referencedColumnName="api_id", onDelete="CASCADE", nullable=false)
     */
    private $api_id;

    /**
     * @ORM\ManyToOne(targetEntity="Customer", inversedBy="keys", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="customer_id", referencedColumnName="customer_id", onDelete="CASCADE", nullable=false)
     */
    private $customer_id;

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
     * @ORM\Column(type="string",length=40,nullable=true, options={"comment" = "Unique reference of this record taken from legacy system"})
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
     * @param int $api_id
     */
    public function setApiId($api_id)
    {
        $this->api_id = $api_id;
    }

    /**
     * @return int
     */
    public function getApiId()
    {
        return $this->api_id;
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

    public function getCreatedBy(): ?string
    {
        return $this->created_by;
    }

    public function setCreatedBy(string $created_by): void
    {
        $this->created_by = $created_by;
    }

    public function getUpdatedBy(): ?string
    {
        return $this->updated_by;
    }

    public function setUpdatedBy(string $updated_by): void
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
