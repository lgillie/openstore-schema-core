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

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity(repositoryClass="OpenstoreSchema\Core\Entity\Repository\RoleRepository")
 * @Gedmo\Tree(type="nested")
 * @ORM\Table(
 *   name="role",
 *   uniqueConstraints={
 *     @ORM\UniqueConstraint(name="unique_name_idx",columns={"name"}),
 *   },
 *   indexes={
 *     @ORM\Index(name="lft_idx", columns={"lft"}),
 *     @ORM\Index(name="rgt_idx", columns={"rgt"}),
 *   },
 *   options={
 *     "comment" = "Access roles",
 *     "charset"="utf8mb4",
 *     "collate"="utf8mb4_unicode_ci"
 *   }
 * )
 */
class Role
{
    /**
     * @var int|null
     *
     * @ORM\Id
     * @ORM\Column(name="role_id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $role_id;

    /**
     * @var string|null
     *
     * @ORM\Column(type="string", length=48)
     */
    protected $name;

    /**
     * @Gedmo\TreeLeft
     * @ORM\Column(type="integer", options={"unsigned"=true})
     */
    private $lft;

    /**
     * @Gedmo\TreeRight
     * @ORM\Column(type="integer", options={"unsigned"=true})
     */
    private $rgt;

    /**
     * @Gedmo\TreeParent
     * @ORM\ManyToOne(targetEntity="Role", inversedBy="children")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="role_id", onDelete="CASCADE")
     */
    private $parent;

    /**
     * @Gedmo\TreeRoot
     * @ORM\Column(type="bigint", nullable=true, options={"unsigned"=true})
     */
    private $root;

    /**
     * @Gedmo\TreeLevel
     * @ORM\Column(name="lvl", type="integer",  options={"unsigned"=true})
     */
    private $level;

    /**
     * @ORM\OneToMany(targetEntity="Role", mappedBy="parent")
     */
    private $children;

    /**
     * @var Collection
     *
     * @ORM\ManyToMany(targetEntity="Permission", indexBy="name", fetch="EAGER")
     * @ORM\JoinTable(name="role_permission",
     *      joinColumns={@ORM\JoinColumn(name="role_id", referencedColumnName="role_id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="permission_id", referencedColumnName="permission_id")}
     *      )
     */
    protected $permissions;

    /**
     * @ORM\ManyToMany(targetEntity="OpenstoreSchema\Core\Entity\User", mappedBy="roles")
     */
    private $users;

    /**
     * Init the Doctrine collection.
     */
    public function __construct()
    {
        $this->children = new ArrayCollection();
        $this->permissions = new ArrayCollection();
        $this->users = new ArrayCollection();
    }

    /**
     * Get the role identifier.
     *
     * @return int|null
     */
    public function getId()
    {
        return $this->role_id;
    }

    /**
     * Get the role identifier.
     *
     * @return int|null
     */
    public function getRoleId()
    {
        return $this->role_id;
    }

    public function setName(string $name)
    {
        $this->name = $name;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    /**
     * {@inheritdoc}
     */
    public function addChild($child)
    {
        $this->children[] = $child;
    }

    /**
     * {@inheritdoc}
     */
    public function addPermission($permission)
    {
        if (is_string($permission)) {
            $permission = new Permission($permission);
        }

        $this->permissions[(string) $permission] = $permission;
    }

    /**
     * {@inheritdoc}
     */
    public function hasPermission($permission)
    {
        // This can be a performance problem if your role has a lot of permissions. Please refer
        // to the cookbook to an elegant way to solve this issue

        return isset($this->permissions[(string) $permission]);
    }

    public function setParent($parent)
    {
        $this->parent = $parent;
    }

    public function getParent()
    {
        return $this->parent;
    }

    public function getRoot()
    {
        return $this->root;
    }

    public function getLevel()
    {
        return $this->level;
    }

    public function getChildren()
    {
        return $this->children;
    }

    public function getLeft()
    {
        return $this->lft;
    }

    public function getRight()
    {
        return $this->rgt;
    }

    /**
     * {@inheritdoc}
     */
    public function hasChildren()
    {
        return !$this->children->isEmpty();
    }

    public function getUsers()
    {
        return $this->users;
    }
}
