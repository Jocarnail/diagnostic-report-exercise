#let report(
    // The name of the company
    title: "A company",

    company_logo: none,

    company_address: none,

    company_contact: none,

    patient: none,

    report: none,

    body
    
    ) = {
    set document(title: title)

    set page(
        margin: (
            x: 1cm,
            top: 1.5cm,
            bottom:1cm
        ),
        background: {
            let date = text(
                    font: "Helvetica", 
                    weight:400, 
                    size: 25pt, 
                    fill: white,
                    report.date)

            layout(size => {
                place(horizon + right, 
                    rect(
                        height: size.height,
                        width: 2cm,
                        fill: eastern,
                        place(bottom,
                            style(style => {
                                let date_size = measure(date).width
                                move(
                                    dy: -date_size,
                                rotate(
                                    -90deg, 
                                    box(width:20cm, 
                                    date
                                )) 
                                )
                            })
                        )
                    )
                )
            })
        },

        footer: [
            #title\; 
            #company_address.street, 
            #company_address.city, 
            #company_address.cap\; 
            #company_contact.phone\;
            #link(company_contact.email.replace("\\", ""))
        ]
    )

    show figure: set block(breakable: true)

    set table(
        inset: (x, y) => {
            let inset = (x:10pt, y:10pt)
            if y != 0 {
                inset.y = 20pt
            }
            inset
        },
        stroke: none
    )

    grid(
        columns: (2fr, 1fr),

        grid(
            columns: (1fr),
            row-gutter: 15pt,
            text(font: "Helvetica", 23pt, upper(title)),
            style(style => {
                if company_address == none {return}

                set text(font: "Helvetica", 18pt)
                [#company_address.street, 
                #company_address.city, 
                #company_address.cap]
            }),
            style(style => {
                set text(font: "Helvetica", 15pt)
                let full_name = patient.name

                [
                    *Paziente:* #full_name\
                    *Data di nascita:* #patient.birth_date\
                    *Esame \#* #report.id
                ]
            })
        ),
        style(style => {
            if company_logo == none {
                return
            }

            let img = image(company_logo)
            img

        })
    )

    show heading: set text(font: "Helvetica")
    show heading.where(level: 1): it => {
        set text(1.1em)
        set par(leading: 0.4em)
        set block(below: 0.8em)

        box(stroke: (bottom:1pt), outset:(bottom: 0.4em), width: 100%, it.body)
    }

    block(
        width:17.5cm,
        breakable: true,
        body
    )
}