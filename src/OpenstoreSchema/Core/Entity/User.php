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
use Doctrine\Common\Collections\Collection;

/**
 * @ORM\Entity(repositoryClass="OpenstoreSchema\Core\Entity\Repository\UserRepository")
 * @ORM\Table(name="user")
 * @ORM\Table(
 *   name="user",
 *   uniqueConstraints={
 *     @ORM\UniqueConstraint(name="unique_username_idx",columns={"username"}),
 *     @ORM\UniqueConstraint(name="unique_email_idx",columns={"email"}),
 *   },
 *   options={
 *     "comment" = "User table",
 *     "charset"="utf8mb4",
 *     "collate"="utf8mb4_unicode_ci"
 *   }
 * )
 */
class User
{
    /**
     * @var int
     * @ORM\Id
     * @ORM\Column(name="user_id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $user_id;

    /**
     * @var string
     * @ORM\Column(type="string", length=80, unique=true, nullable=true)
     */
    protected $username;

    /**
     * @var string
     * @ORM\Column(type="string", length=130)
     */
    protected $email;

    /**
     * @var string
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    protected $displayName;

    /**
     * @var string
     * @ORM\Column(type="string", length=128)
     */
    protected $password;

    /**
     * @ORM\ManyToOne(targetEntity="Language", inversedBy="user_default_language")
     * @ORM\JoinColumn(name="lang", referencedColumnName="lang", onDelete="SET NULL", nullable=true)
     */
    private $lang;

    /**
     * Bidirectional - Many users have many roles (OWNING SIDE).
     *
     * @var Collection
     *
     * @ORM\ManyToMany(targetEntity="OpenstoreSchema\Core\Entity\Role", inversedBy="users")
     * @ORM\JoinTable(name="user_role",
     *      joinColumns={@ORM\JoinColumn(name="user_id", referencedColumnName="user_id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="role_id", referencedColumnName="role_id")}
     * )
     */
    protected $roles;

    /**
     * @var Collection
     * @ORM\OneToMany(targetEntity="UserPricelist", mappedBy="user_id")
     */
    protected $pricelists;

    /**
     * Initialies the roles variable.
     */
    public function __construct()
    {
        $this->roles = new ArrayCollection();
        $this->pricelists = new ArrayCollection();
    }

    public function getId()
    {
        return $this->user_id;
    }

    public function setId($id)
    {
        $this->user_id = $id;
    }

    /**
     * Get id.
     *
     * @return int
     */
    public function getUserId()
    {
        return $this->user_id;
    }

    /**
     * Set id.
     *
     * @param int|string $user_id
     */
    public function setUserId($user_id)
    {
        $this->user_id = (int) $user_id;
    }

    /**
     * Get username.
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set username.
     *
     * @param string $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * Get email.
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set email.
     *
     * @param string $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }

    /**
     * Get displayName.
     *
     * @return string
     */
    public function getDisplayName()
    {
        return $this->displayName;
    }

    /**
     * Set displayName.
     *
     * @param string $displayName
     */
    public function setDisplayName($displayName)
    {
        $this->displayName = $displayName;
    }

    /**
     * Get password.
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set password.
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = $password;
    }

    /**
     * @return Role[]
     */
    public function getRoles()
    {
        return $this->roles->toArray();
    }

    /**
     * Set the list of roles.
     *
     * @param Collection $roles
     */
    public function setRoles(Collection $roles)
    {
        $this->roles->clear();
        foreach ($roles as $role) {
            $this->roles[] = $role;
        }
    }

    /**
     * @return Collection
     */
    public function getPricelists()
    {
        return $this->pricelists;
    }
}
