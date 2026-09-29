import LessonView from "../../../../../LessonView";

// Outside the (app) shell on purpose: a lesson is full screen, with its
// own tree of the unit where the sidebar would be.
export default async function Page(props: PageProps<"/cursos/[curso]/clases/[clase]">) {
  const { curso, clase } = await props.params;
  return (
    <LessonView
      // Keyed so moving to another lesson from the tree starts on its cover.
      key={clase}
      courseCode={decodeURIComponent(curso)}
      lessonCode={decodeURIComponent(clase)}
    />
  );
}
