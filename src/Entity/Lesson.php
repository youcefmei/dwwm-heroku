<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\LessonRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Component\Validator\Constraints\NotNull;
use Symfony\Component\Validator\Constraints\NotBlank;

#[ORM\Entity(repositoryClass: LessonRepository::class)]
#[ORM\UniqueConstraint(
    name: 'section_title_idx',
    columns: ['title', 'section_id']
)]
class Lesson
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'text')]
    #[NotBlank(message:'Veuillez entrer du texte')]
    private $content;

    #[ORM\Column(type: 'string', length: 190)]
    private $slug;

    #[ORM\Column(type: 'datetime_immutable')]
    private $update_at;

    #[ORM\Column(type: 'boolean', options: ["default" => true])]
    private $is_published;

    #[ORM\ManyToOne(targetEntity: Section::class, inversedBy: 'lessons', cascade:['remove'])]
    #[ORM\JoinColumn(nullable: true)]
    private $section;

    #[ORM\Column(type: 'string', length: 190)]
    #[NotBlank(message:'Veuillez entrer un titre')]
    private $title;

    #[ORM\Column(type: 'string', length: 190)]
    #[NotBlank(message:'Veuillez entrer un lien')]
    private $media;

    #[ORM\OneToMany(mappedBy: 'lesson', targetEntity: LessonStudent::class)]
    private $lessonStudents;

    #[ORM\ManyToOne(targetEntity: Teacher::class, inversedBy: 'lessons')]
    #[ORM\JoinColumn(nullable: false)]
    private $teacher;



    public function __construct()
    {
        $this->update_at = new \DateTimeImmutable();
        $this->content = ' ';
        $this->lessonStudents = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content=null): self
    {
        $this->content =  $content ? $content:"" ;
        $this->update_at = new \DateTimeImmutable();
        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;
        return $this;
    }

    public function getUpdateAt(): ?\DateTimeImmutable
    {
        return $this->update_at;
    }

    public function setUpdateAt(\DateTimeImmutable $update_at): self
    {
        $this->update_at = $update_at;

        return $this;
    }

    public function getIsPublished(): ?bool
    {
        return $this->is_published;
    }

    public function setIsPublished(bool $is_published): self
    {
        $this->is_published = $is_published;

        return $this;
    }

    public function getSection(): ?Section
    {
        return $this->section;
    }

    public function setSection(?Section $section): self
    {
        $this->section = $section;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;
        if (!$this->slug) {
            $this->slug = (new AsciiSlugger())->slug($title);
        }

        return $this;
    }

    public function getMedia(): ?string
    {
        return $this->media;
    }

    public function setMedia(string $media): self
    {
        $this->media = $media;

        return $this;
    }

    /**
     * @return Collection<int, LessonStudent>
     */
    public function getLessonStudents(): Collection
    {
        return $this->lessonStudents;
    }

    public function addLessonStudent(LessonStudent $lessonStudent): self
    {
        if (!$this->lessonStudents->contains($lessonStudent)) {
            $this->lessonStudents[] = $lessonStudent;
            $lessonStudent->setLesson($this);
        }

        return $this;
    }

    public function removeLessonStudent(LessonStudent $lessonStudent): self
    {
        if ($this->lessonStudents->removeElement($lessonStudent)) {
            // set the owning side to null (unless already changed)
            if ($lessonStudent->getLesson() === $this) {
                $lessonStudent->setLesson(null);
            }
        }

        return $this;
    }

    public function getTeacher(): ?Teacher
    {
        return $this->teacher;
    }

    public function setTeacher(?Teacher $teacher): self
    {
        $this->teacher = $teacher;

        return $this;
    }
}
